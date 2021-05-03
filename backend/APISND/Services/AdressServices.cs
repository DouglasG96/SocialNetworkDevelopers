using APISND.Interface;
using APISND.Models;
using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Services
{
    public class AdressServices : IAdress
    {
        static readonly ILog log = LogManager.GetLogger(typeof(SaleOrderServices));

        private readonly SocialNetworkDeveloperContext _context;

        public AdressServices(SocialNetworkDeveloperContext context)
        {
            _context = context;
        }
        public List<Departamento> GetDepartments()
        {
            try
            {
                return  _context.Departamentos.ToList();
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de departamentos GetDepartments()  {0} : {1} ", e.Source, e.Message);

                throw;
            }
        }

        public List<Municipio> GetMunicipalitys(int idDepartment)
        {
            try
            {
                return _context.Municipios.Where(x => x.IdDepartamento == idDepartment).ToList();
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de municipios GetDepartments()  {0} : {1} ", e.Source, e.Message);

                throw;
            }
        }
    }
}
