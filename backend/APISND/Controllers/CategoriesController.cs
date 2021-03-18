using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SNDAPI.DTO;
using SNDAPI.Exceptions;
using SNDAPI.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SNDAPI.Services;
using APISND.Requests;

namespace SNDAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]/v1/[action]")]
    public class CategoriesController : ControllerBase
    {
        
        private readonly ICategories _categorias;

        public CategoriesController(ICategories categorias)
        {
            _categorias = categorias;
        } 


        [HttpGet]
        [ProducesResponseType(typeof(string), 200)]
        [ProducesResponseType(401)]
        [AllowAnonymous]
        public IActionResult CargarCategorias()
        {
            try
            {
                var listaCategorias = _categorias.CargarCategorias();

                return Ok(new { response = listaCategorias, status = StatusCodes.Status200OK });
            }
            catch (CategoriesLoadException e)
            {
                return StatusCode(StatusCodes.Status404NotFound, e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500);
            }
        }
    }
}
