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
    public class BuyOrderServices : IBuyOrder
    {
        static readonly ILog log = LogManager.GetLogger(typeof(BuyOrderServices));
        private readonly SocialNetworkDeveloperContext _context;
        private readonly IMapper _mapper;

        public BuyOrderServices(SocialNetworkDeveloperContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public  List<BuyOrderDTO> GetHistoryBuysByIdBuyer(int id)
        {
            try
            {
                var list = (from s in _context.OrdenesCompras
                            join p in _context.Publicaciones
                            on s.IdPublicacion equals p.IdPublicacion
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
                                TituloPublicacion = p.Titulo

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

            return "";
        }

    }
}
