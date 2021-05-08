using APISND.DTO;
using APISND.Helpers;
using APISND.Interface;
using APISND.Models;
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


        [AuthorizeRoles(Rol.Administrator)]
        [HttpGet]
        [ProducesResponseType(typeof(SubCategoryDTO), 201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public IActionResult GetAllSubCategories()
        {
            try
            {
                var resp = _mapper.Map<List<SubCategoryDTO>>(_subCategoryServices.GetAllSubCategories());

                if (resp == null)
                    return NotFound(resp);

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        /// <summary>
        /// Petición para obtener sub-categorias
        /// </summary>
        /// <param name="idCategory"></param>
        /// <returns></returns>
        //[AuthorizeRoles(Rol.Seller, Rol.Buyer, Rol.Administrator)]
        [HttpGet]
        [ProducesResponseType(typeof(SubCategoryDTO), 200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(500)]
        public IActionResult GetSubCategoryByCategory(int idCategory)
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

        //[AuthorizeRoles(Rol.Administrator)]
        [HttpPost]
        [ProducesResponseType(typeof(SubCategoryDTO), 201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> AddSubCategory([FromBody] SubCategoryDTO subCategoryDTO)
        {
            try
            {
                var subCategory = _mapper.Map<SubCategoria>(subCategoryDTO);
                var resp = await _subCategoryServices.AddSubCategory(subCategory);

                if (resp == null)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                return StatusCode(StatusCodes.Status201Created, subCategory);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }
    }
}
