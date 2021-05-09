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
    public class StatisticsServices : IStatistics
    {
        static readonly ILog log = LogManager.GetLogger(typeof(StatisticsServices));
        private readonly SocialNetworkDeveloperContext _context;
        //private readonly IMapper _mapper;

        public StatisticsServices(SocialNetworkDeveloperContext context, IMapper mapper)
        {
            _context = context;
           //_mapper = mapper;
        }
       
        public List<StatisticsDTO> GetStatistics()
        {
            return null;
            try
            {
                int datos = _context.Publicaciones.Count();
                var list = (from  pbl in _context.Publicaciones
                            select new StatisticsDTO
                            {

                            }).ToList();
                return list;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de la wishlist del usuario GetPublicationWishList()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }
   }

}
