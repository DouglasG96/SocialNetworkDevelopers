using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SNDAPI.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SNDAPI.Services;
using AutoMapper;
using APISND.Helpers;
using APISND.Models;

namespace APISND.DTO
{
    [ApiController]
    [Route("api/v1/[controller]/[action]")]

    public class CategoriesController : ControllerBase
    {
        
        private readonly ICategories _categoryServices;
        private readonly IMapper _mapper;

        public CategoriesController(ICategories category, IMapper mapper)
        {
            _categoryServices = category;
            _mapper = mapper;
        } 


        [HttpGet]
        [AuthorizeRoles(Rol.Administrator, Rol.Buyer, Rol.Seller)]
        [ProducesResponseType(typeof(CategoriesDTO), 200)]
        [ProducesResponseType(401)]
        public IActionResult GetCategories()
        {
            try
            {
                var resp = _mapper.Map<List<CategoriesDTO>>(_categoryServices.GetCategories());

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
        /// Peticioón para agregar una categoria
        /// </summary>
        /// <param name="categoriesDTO"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Administrator)]
        [HttpPost]
        [ProducesResponseType(typeof(CategoriesDTO), 201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> AddCategory([FromBody] CategoriesDTO categoriesDTO)
        {
            try
            {
                var category = _mapper.Map<Categoria>(categoriesDTO);
                var resp = await _categoryServices.AddCategory(category);

                if (resp == null)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                return StatusCode(StatusCodes.Status201Created, category);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }
    }
}
