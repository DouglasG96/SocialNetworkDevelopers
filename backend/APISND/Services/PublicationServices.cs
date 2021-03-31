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
    public class PublicationServices : IPublication
    {
        static readonly ILog log = LogManager.GetLogger(typeof(UserServices));

        private readonly SocialNetworkDeveloperContext _context;
        private readonly IMapper _mapper;
        public PublicationServices(SocialNetworkDeveloperContext context)
        {
            _context = context;
        }
        public List<Publicacione> GetPublications()
        {
            try
            {
                return _context.Publicaciones.ToList();
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Publicaciones GetPublications()  {0} : {1} ", e.Source, e.Message);
                throw;

            }
        }
    }
}
