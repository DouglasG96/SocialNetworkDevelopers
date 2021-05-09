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
    public class SubCategoryServices : ISubCategory
    {
        static readonly ILog log = LogManager.GetLogger(typeof(SubCategoryServices));

        private readonly SocialNetworkDeveloperContext _context;

        public SubCategoryServices(SocialNetworkDeveloperContext context)
        {
            _context = context;
        }

        public List<SubCategoria> GetAllSubCategories()
        {
            try
            {
                return _context.SubCategorias.ToList();

            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de SubCategoria GetAllCategories()  {0} : {1} ", e.Source, e.Message);
                throw;
            }

        }

        public List<SubCategoria> GetSubCategoryByCategory(int id)
        {
            try
            {
                return _context.SubCategorias.Where(x => x.IdCategoria == id).ToList();

            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de SubCategoria GetSubCategoryByCategory()  {0} : {1} ", e.Source, e.Message);
                throw;
            }

        }

        public async Task<SubCategoria> EditSubCategory(SubCategoria subCategoria)
        {
            try
            {
                var model = await _context.SubCategorias.AsNoTracking().FirstOrDefaultAsync(x => x.IdSubCategoria == subCategoria.IdSubCategoria);
                if (model != null)
                {
                    _context.SubCategorias.Add(subCategoria).State = EntityState.Modified;
                    await _context.SaveChangesAsync();

                    return subCategoria;
                }
                return null;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al  Actualizar Usuario UpdateUser()  {0} : {1} ", e.Source, e.Message);

                throw;
            }
        }

        public async Task<SubCategoria> AddSubCategory(SubCategoria subCategoria)
        {
            try
            {
                _context.SubCategorias.Add(subCategoria);
                await _context.SaveChangesAsync();
                return subCategoria;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Crear Categoria AddSubCategory()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }
    }
}
