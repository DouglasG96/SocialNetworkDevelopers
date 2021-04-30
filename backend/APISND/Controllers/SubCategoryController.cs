using APISND.DTO;
using APISND.Helpers;
using APISND.Interface;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Controllers
{
    [Route("api/v1/[controller]/[action]")]

    [ApiController]
    public class SubCategoryController : ControllerBase
    {
        private readonly ISubCategory _subCategoryServices;
        private readonly IMapper _mapper;
        public SubCategoryController(ISubCategory subCategory, IMapper mapper)
        {
            _subCategoryServices = subCategory;
            _mapper = mapper;
        }

        /// <summary>
        /// Petición para obtener sub-categorias
        /// </summary>
        /// <param name="idCategory"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Seller, Rol.Buyer)]
        [HttpGet]
        [ProducesResponseType(typeof(SubCategoryDTO), 200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(500)]
        public IActionResult GetCategories(int idCategory)
        {
            try
            {
                var resp = _mapper.Map<List<SubCategoryDTO>>(_subCategoryServices.GetSubCategoryByCategory(idCategory));

                if (resp == null)
                    return NotFound(resp);

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }
    }
}
