using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using log4net;
using Microsoft.EntityFrameworkCore;
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
                            //IdOrdenCompra = 0,
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
                            Title = string.Format("Se Realizo una solicitud de compra/venta de la Publicaicon {0}", publication.Titulo),
                            MessagesSeller = string.Format(@"Estimado/a <b>{0}</b> se ha realizado una solicitud de venta a travez de nuestra aplicación, 
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

                            MessagesBuyer = string.Format(@"Estimado/a <b>{0}</b> se ha realizado una solicitud de compra a travez de nuestra aplicación, 
                                                    <br/> 
                                                    Detalle De la Compra 
                                                    <br/>
                                                    Publicación: <b>{1}</b>
                                                    <br/>
                                                    Cantidad: <b>{2}</b>"
                                                     
                                                    , buyer.NombreCompleto, publication.Titulo, saleOrderDTO.Cantidad),
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

        public  List<SaleOrderDTO> GetHistorySalesByIdSeller(int id)
        {
            try
            {
                var list =  (from s in _context.OrdenesVentas
                            join p in _context.Publicaciones
                            on s.IdPublicacion equals p.IdPublicacion
                            join c in _context.OrdenesCompras
                            on p.IdPublicacion equals c.IdPublicacion
                            join u in _context.Usuarios
                            on c.IdUsuario equals u.IdUsuario 
                            where s.IdUsuario == id
                            orderby s.FechaHoraOrdenVenta descending
                            select new SaleOrderDTO
                            {
                                IdOrdenVenta = s.IdOrdenVenta,
                                IdPublicacion = s.IdPublicacion,
                                IdUsuario = s.IdUsuario,
                                EstadoOrdenVenta = statusSales(s.EstadoOrdenVenta),
                                FechaHoraOrdenVenta = Convert.ToDateTime(s.FechaHoraOrdenVenta).ToString("dd/MM/yyyy HH:mm:ss"),
                                TotalVentaConIva = s.TotalVentaConIva,
                                TotalVentaSinIva = s.TotalVentaSinIva,
                                Cantidad = (int)s.Cantidad,
                                TituloPublicacion = p.Titulo,
                                Comprador = u.NombreCompleto,
                                IdOrdenCompra = c.IdOrdenCompra

                            }).ToList();
                //var saleOrder =  _context.OrdenesVentas.Where(x => x.IdUsuario == id).ToList();

                return list;

            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Ordenes de Ventas GetHistorySalesByIdSeller()  {0} : {1} ", e.Source, e.Message);

                throw;
            }

        }

        private static string statusSales(string status)
        {
            if (status == "1")
                return "Pendiente";
            if (status == "2")
                return "Aprobada";
            if (status == "3")
                return "Cancelada";

            return "";
        }

        public async Task<bool> AprovveSale(int idSaleOrder, int ididBuyOrder)
        {
            using (var db = new SocialNetworkDeveloperContext())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        //actualizo orden de venta
                        var saleOrder =  await _context.OrdenesVentas.FirstOrDefaultAsync(x => x.IdOrdenVenta == idSaleOrder);

                        if(saleOrder != null)
                        {
                            saleOrder.EstadoOrdenVenta = "2"; //aprobada
                        }
                        db.OrdenesVentas.Add(saleOrder).State = EntityState.Modified;
                        await _context.SaveChangesAsync();

                        //actualizacion orden de compra
                        var buyOrder = await _context.OrdenesCompras.FirstOrDefaultAsync(x => x.IdOrdenCompra == ididBuyOrder);
                        if (buyOrder != null)
                        {
                            buyOrder.EstadoOrdenCompra = "2"; //aprobada
                        }
                        db.OrdenesCompras.Add(buyOrder).State = EntityState.Modified;
                        await _context.SaveChangesAsync();


                        await transaction.CommitAsync();

                        return true;
                    }
                    catch (Exception e)
                    {

                        transaction.Rollback();
                        log.ErrorFormat("Error al ejecutar transaccion para aprobar venta AprovveSale()  {0} : {1} ", e.Source, e.Message);

                        return false;
                    }
                }
            }
        }
    }
}
