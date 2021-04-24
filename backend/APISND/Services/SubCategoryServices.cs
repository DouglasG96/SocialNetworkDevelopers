﻿using APISND.Interface;
using APISND.Models;
using log4net;
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
    }
}