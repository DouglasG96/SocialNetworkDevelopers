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
    }
}
