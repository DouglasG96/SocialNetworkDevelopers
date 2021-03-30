using APISND.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SNDAPI.DTO;
using SNDAPI.Exceptions;
using SNDAPI.Interface;
using APISND.Requests;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace SNDAPI.Services
{
    public class CategoriesServices : ICategories
    {
        private readonly SocialNetworkDeveloperContext _context;
        private IConfiguration _configuration;

        public CategoriesServices(SocialNetworkDeveloperContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public List<CategoriesRequest> CargarCategorias()
        {
            try
            {
                var categorias = (from indiceCategorias in _context.Categorias
                                           where indiceCategorias.EstadoCategoria == 1
                                           select new CategoriesRequest
                                           {
                                               IdCategoria = indiceCategorias.IdCategoria,
                                               NombreCategoria = indiceCategorias.NombreCategoria,
                                               EstadoCategoria = indiceCategorias.EstadoCategoria,
                                           }).ToList();
                if (categorias == null)
                {
                    throw new CategoriesLoadException($"Hubo un error al cargar la informacion");
                }
                else
                {
                    return categorias;
                }
            }
            catch (Exception e)
            {

                throw;
            }
        }
    }
}
