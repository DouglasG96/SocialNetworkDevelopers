using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Services
{
    public class SaleOrderServices : ISaleOrder
    {
        private readonly SocialNetworkDeveloperContext _context;

        private readonly IMapper _mapper;
        private readonly IEmail _emailServices;
        private readonly IUser _userServices;
        private readonly IPublication _publicationServices;



        public SaleOrderServices(SocialNetworkDeveloperContext context, IMapper maper, IEmail email, IUser user, IPublication publication)
        {
            _context = context;
            _mapper = maper;
            _emailServices = email;
            _userServices = user;
            _publicationServices = publication;
        }
        public async Task<bool> AddSale(SaleOrderDTO saleOrderDTO)
        {
            using(var db = new SocialNetworkDeveloperContext())
            {
                using(var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        var saleOrder = _mapper.Map<OrdenesVenta>(saleOrderDTO);
                        saleOrder.FechaHoraOrdenVenta = DateTime.Now;
                        db.OrdenesVentas.Add(saleOrder);
                        await db.SaveChangesAsync();
                        OrdenesVentasDetalle o = new OrdenesVentasDetalle()
                        {
                            IdOrdenVenta = saleOrder.IdOrdenVenta,
                            Cantidad = saleOrderDTO.Cantidad,
                            EstadoOrdenNegocioDetalle = 1,
                            MontoSinIva = saleOrderDTO.TotalVentaSinIva,
                            MontoConIva = saleOrderDTO.TotalVentaConIva,
                        };
                        db.OrdenesVentasDetalles.Add(o);
                        await db.SaveChangesAsync();

                        var seller = await _userServices.GetUserByID((int)saleOrderDTO.IdUsuario);
                        var buyer = await _userServices.GetUserByID((int)saleOrderDTO.IdComprador);
                        var publication = await _publicationServices.GetPublicationById((int)saleOrderDTO.IdPublicacion);
                        EmailDTO emailDTO = new EmailDTO()
                        {
                            EmailBuyer = buyer.CorreoElectronico,
                            EmailSeller = seller.CorreoElectronico,
                            Title = string.Format("Se Realizo una venta de la Publicaicon {0}", publication.Descripcion),
                            Messages = string.Format(@"Estimado/a <b>{0}</b> se ha realizado una venta a travez de nuestra aplicación, 
                                                    <br/> 
                                                    Detalle De la Venta 
                                                    <br/>
                                                    Producto: <b>{1}</b>
                                                    <br/>
                                                    Cantidad: <b>{2}</b>
                                                     <br/>
                                                    Cliente: <b>{3}</b>"
                                                    , seller.NombreCompleto, publication.Descripcion, saleOrderDTO.Cantidad, buyer.NombreCompleto),
                        };
                        //si falla envio correo no registrar la venta
                        var email = await _emailServices.SendEmailBuy(emailDTO);

                        if (!email)
                            throw new Exception();

                        await transaction.CommitAsync();

                        return true;
                    }
                    catch (Exception)
                    {

                        transaction.Rollback();
                        return false;
                    }
                }
            }
        }
    }
}
