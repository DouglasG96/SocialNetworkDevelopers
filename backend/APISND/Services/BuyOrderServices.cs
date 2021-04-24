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

        public List<OrdenesCompra> GetHistoryBuysByIdBuyer(int idBuyer)
        {
            try
            {
                var data = _context.OrdenesCompras.Where(x => x.IdUsuario == idBuyer).ToList();
                return data;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Usuario GetHistoryOrder()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }
    }
}
