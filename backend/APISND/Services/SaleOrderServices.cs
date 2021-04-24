using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Services
{
    public class SaleOrderServices : ISaleOrder
    {
        static readonly ILog log = LogManager.GetLogger(typeof(SaleOrderServices));

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

                        var seller = await _userServices.GetUserByID((int)saleOrderDTO.IdUsuario);
                        var buyer = await _userServices.GetUserByID((int)saleOrderDTO.IdComprador);
                        var publication = await _publicationServices.GetPublicationById((int)saleOrderDTO.IdPublicacion);

                        var saleOrder = _mapper.Map<OrdenesVenta>(saleOrderDTO);
                        saleOrder.FechaHoraOrdenVenta = DateTime.Now;
                        saleOrder.TotalVentaConIva = saleOrderDTO.Cantidad * (publication.Precio + (publication.Precio * 0.13m));
                        saleOrder.TotalVentaSinIva = saleOrderDTO.Cantidad * publication.Precio;
                        db.OrdenesVentas.Add(saleOrder);
                        await db.SaveChangesAsync();

                        //Creacion de orden de compra
                        OrdenesCompra objCompra = new OrdenesCompra()
                        {
                            IdOrdenCompra = 0,
                            IdPublicacion = publication.IdPublicacion,
                            IdUsuario = buyer.IdUsuario,
                            FechaHoraOrdenCompra = DateTime.Now,
                            TotalCompraConIva = saleOrderDTO.Cantidad * (publication.Precio + (publication.Precio * 0.13m)),
                            TotalCompraSinIva = saleOrderDTO.Cantidad * publication.Precio,
                            EstadoOrdenCompra = "1",
                            Cantidad = saleOrderDTO.Cantidad
                        };
                        db.OrdenesCompras.Add(objCompra);
                        await db.SaveChangesAsync();

                        EmailDTO emailDTO = new EmailDTO()
                        {
                            EmailBuyer = buyer.CorreoElectronico,
                            EmailSeller = seller.CorreoElectronico,
                            Title = string.Format("Se Realizo una venta de la Publicaicon {0}", publication.Titulo),
                            Messages = string.Format(@"Estimado/a <b>{0}</b> se ha realizado una venta a travez de nuestra aplicación, 
                                                    <br/> 
                                                    Detalle De la Venta 
                                                    <br/>
                                                    Publicación: <b>{1}</b>
                                                    <br/>
                                                    Cantidad: <b>{2}</b>
                                                     <br/>
                                                    Cliente: <b>{3}</b>
                                                    <br/> 
                                                    Telefono: <b>{4}</b>
                                                    <br/> 
                                                    Dirección Entrega: <b>{5}</b>
                                                    <br/> 
                                                    Comentario: <b>{6}</b>"
                                                    , seller.NombreCompleto, publication.Titulo, saleOrderDTO.Cantidad, buyer.NombreCompleto, buyer.TelefonoContacto, saleOrderDTO.DireccionEntrega, saleOrderDTO.Comentario),
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

        public List<OrdenesVenta> GetHistorySalesByIdSeller(int id)
        {
            try
            {
                var data =  _context.OrdenesVentas.Where(x => x.IdUsuario == id).ToList();
                return data;

            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Ordenes de Ventas GetHistorySalesByIdSeller()  {0} : {1} ", e.Source, e.Message);

                throw;
            }

        }
    }

/*    
    public bool addBuyOrder()
    {

    }
*/
}
