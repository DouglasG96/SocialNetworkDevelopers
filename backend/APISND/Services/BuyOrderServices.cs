using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using log4net;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Services
{
    public class BuyOrderServices : IBuyOrder
    {
        static readonly ILog log = LogManager.GetLogger(typeof(BuyOrderServices));
        private readonly SocialNetworkDeveloperContext _context;
        private readonly IMapper _mapper;
        private readonly IEmail _emailServices;
        private readonly IUser _userServices;
        private readonly IPublication _publicationServices;
        private readonly ITwilio _twilioServices;


        public BuyOrderServices(SocialNetworkDeveloperContext context, IMapper mapper, IEmail email, IUser user, IPublication publication, ITwilio twilioServices)
        {
            _context = context;
            _mapper = mapper;
            _emailServices = email;
            _userServices = user;
            _publicationServices = publication;
            _twilioServices = twilioServices;
        }

        public  List<BuyOrderDTO> GetHistoryBuysByIdBuyer(int id)
        {
            try
            {
                var list = (from s in _context.OrdenesCompras
                            join p in _context.Publicaciones
                            on s.IdPublicacion equals p.IdPublicacion
                            join v in _context.OrdenesVentas
                            on s.IdOrdenVenta equals v.IdOrdenVenta
                            join u in _context.Usuarios
                            on p.IdUsuario equals u.IdUsuario
                            where s.IdUsuario == id
                            orderby s.FechaHoraOrdenCompra descending
                            select new BuyOrderDTO
                            {
                                IdOrdenCompra = s.IdOrdenCompra,
                                IdPublicacion = s.IdPublicacion,
                                IdUsuario = s.IdUsuario,
                                EstadoOrdenCompra = statusBuyer((int) s.EstadoOrdenCompra),
                                FechaHoraOrdenCompra = Convert.ToDateTime(s.FechaHoraOrdenCompra).ToString("dd/MM/yyyy HH:mm:ss"),
                                TotalCompra = s.TotalCompra,
                                Cantidad = (int)s.Cantidad,
                                TituloPublicacion = p.Titulo,
                                IdOrdenVenta = v.IdOrdenVenta,
                                Vendedor = u.NombreCompleto

                            }).ToList();

                return list;

            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Ordenes de Compra GetHistoryBuysByIdBuyer()  {0} : {1} ", e.Source, e.Message);

                throw;
            }
        }

        private static string statusBuyer(int status)
        {
            if (status == 1)
                return "Pendiente";
            if (status == 2)
                return "Aprobada";
            if (status == 3)
                return "Cancelada";
            if (status == 4)
                return "Recibido";

            return "";
        }

        public async Task<bool> ReceivedBuyer(ReceivedBuyerDTO receivedBuyerDTO)
        {
            try
            {
                using (var db = new SocialNetworkDeveloperContext())
                {
                    using (var transaction = db.Database.BeginTransaction())
                    {
                        try
                        {

                            var buyOrder = await db.OrdenesCompras.FirstOrDefaultAsync(x => x.IdOrdenCompra == receivedBuyerDTO.IdBuyOrder);

                            if (buyOrder == null)
                                return false;

                            var buyer = await _userServices.GetUserByID((int)buyOrder.IdUsuario);
                          
                            buyOrder.EstadoOrdenCompra = 4; //recibido
                            db.Update(buyOrder).State = EntityState.Modified;
                            await db.SaveChangesAsync();

                            //actualizacion orden de compra
                            var saleOrder = await db.OrdenesVentas.FirstOrDefaultAsync(x => x.IdOrdenVenta == receivedBuyerDTO.IdSaleOrder);
                            if (saleOrder != null)
                            {
                                saleOrder.EstadoOrdenVenta = 4; //entregado
                                db.Update(saleOrder).State = EntityState.Modified;
                                await db.SaveChangesAsync();
                            }

                            //inserto raiting de publicacion
                            Rating rating = new Rating()
                            {
                                Rating1 = receivedBuyerDTO.Raiting,
                                FechaHoraCreacion = DateTime.Now,
                                IdPublicacion = buyOrder.IdPublicacion,
                                IdUsuario = buyOrder.IdUsuario
                            };
                            db.Ratings.Add(rating);
                            await db.SaveChangesAsync();

                            //actualizar publicación
                            //var publication = await _publicationServices.GetPublicationById((int)buyOrder.IdPublicacion);
                            var publication = await db.Publicaciones.FirstOrDefaultAsync(x => x.IdPublicacion == buyOrder.IdPublicacion);

                            //if (publication != null)
                            //{
                            //    publication.Raiting = receivedBuyerDTO.Raiting;

                            //    db.Update(publication).State = EntityState.Modified;
                            //    await _context.SaveChangesAsync();
                            //}


                            var seller = await _userServices.GetUserByID((int)publication.IdUsuario);


                            EmailDTO emailDTO = new EmailDTO()
                            {
                                EmailBuyer = buyer.CorreoElectronico,
                                EmailSeller = seller.CorreoElectronico,
                                Title = string.Format("Su compra/venta de la Publicacion {0} fue Entregada", publication.Titulo),
                                MessagesSeller = string.Format(@"Estimado/a <b>{0}</b> el comprador acaba de confirmar de recibido la mercaderia, gracias por utilizar SNB&S, 
                                                    <br/> 
                                                    Detalle de la Venta 
                                                    <br/>
                                                    Publicación: <b>{1}</b>
                                                    <br/>
                                                    Cantidad: <b>{2}</b>
                                                     <br/>
                                                    Cliente: <b>{3}</b>
                                                    <br/> 
                                                    Telefono: <b>{4}</b>
                                                    <br/>
                                                    Total: <b>{5}</b>"
                                , seller.NombreCompleto, publication.Titulo, saleOrder.Cantidad, buyer.NombreCompleto, buyer.TelefonoContacto, saleOrder.TotalVenta),

                                MessagesBuyer = string.Format(@"Estimado/a <b>{0}</b> acaba de confirmar de recibido la mercaderia de su compra, gracias por utilizar SNB&S, 
                                                    <br/> 
                                                    Detalle De la Compra 
                                                    <br/>
                                                    Publicación: <b>{1}</b>
                                                    <br/>
                                                    Cantidad: <b>{2}</b>
                                                    <br/>
                                                    Total: <b>{3}</b>
                                                    <br/>
                                                    Vendedor: <b>{4}</b>
                                                    <br/>
                                                    Telefono: <b>{5}</b>"

                                , buyer.NombreCompleto, publication.Titulo, saleOrder.Cantidad, Math.Round((decimal)saleOrder.TotalVenta, 2), seller.NombreCompleto, seller.TelefonoContacto),
                            };
                            //si falla envio correo no registrar la aprobacion
                            var email = await _emailServices.SendEmail(emailDTO);

                            if (!email)
                                throw new Exception();

                            //envio sms twilio
                            var smsSeller = await _twilioServices.SendSMS(seller.TelefonoContacto, "Una Venta fue Entregada con Exito en SNB&S");
                            if (!smsSeller)
                                throw new Exception();

                            var smsBuyer = await _twilioServices.SendSMS(buyer.TelefonoContacto, "Acabas de Confirmar de Recibido tu Compra en SNB&S");
                            if (!smsBuyer)
                                throw new Exception();


                            await transaction.CommitAsync();

                            return true;
                        }
                        catch (Exception e)
                        {

                            transaction.Rollback();
                            log.ErrorFormat("Error al ejecutar transaccion para confirmar de recibido la mercaderia ReceivedBuyer() {0} : {1} ", e.Source, e.Message);

                            return false;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al actualizar orden de compra a recibido ReceivedBuyer()  {0} : {1} ", e.Source, e.Message);
                return false;
                throw;
            }
        }

        public List<BuySummaryDTO> GetBuySummary()
        {
            var list = new List<BuySummaryDTO>();
            try
            {
                var connection = _context.Database.GetDbConnection();
                using (SqlConnection cnx = new SqlConnection(connection.ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_salesSummary", cnx);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cnx.Open();
                    var result = cmd.ExecuteReader();
                    if (result.HasRows)
                    {
                        while (result.Read())
                        {
                            BuySummaryDTO b = new BuySummaryDTO()
                            {
                               Title = result["Title"].ToString(), 
                               Value = (int)result["Value"],
                               Icon = result["Icon"].ToString(),
                               Color1 = result["Color1"].ToString(),
                               Color2 = result["Color2"].ToString(),

                            };
                            list.Add(b);
                        }
                    }
                }

            }
            catch (Exception)
            {
                
                throw;
            }
            return list;
        }
    }
}
