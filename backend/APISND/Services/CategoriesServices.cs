using APISND.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SNDAPI.Exceptions;
using SNDAPI.Interface;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using log4net;

namespace SNDAPI.Services
{
    public class CategoriesServices : ICategories
    {
        static readonly ILog log = LogManager.GetLogger(typeof(CategoriesServices));

        private readonly SocialNetworkDeveloperContext _context;
        private IConfiguration _configuration;

        public CategoriesServices(SocialNetworkDeveloperContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        public async Task<Categoria> AddCategory(Categoria categoria)
        {
            try
            {
                _context.Categorias.Add(categoria);
                await _context.SaveChangesAsync();
                return categoria;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Crear Categoria AddCategory()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public List<Categoria> GetCategories()
        {
            try
            {
                return _context.Categorias.ToList();
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Categorias CategoriesServices()  {0} : {1} ", e.Source, e.Message);
                throw;

            }
 
        }
    }
}
