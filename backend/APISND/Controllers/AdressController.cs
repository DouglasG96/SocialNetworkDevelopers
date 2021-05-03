using APISND.Interface;
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
    public class AdressController : ControllerBase
    {
        private readonly IAdress _adressServices;

        public AdressController(IAdress adress)
        {
            _adressServices = adress;
        }

        /// <summary>
        /// Peticion para obtener departamentos
        /// </summary>
        /// <returns></returns>
        //[AuthorizeRoles(Rol.Administrator)]
        [ProducesResponseType(200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [AllowAnonymous]

        [HttpGet]
        public IActionResult GetDepartments()
        {
            try
            {
                var resp = _adressServices.GetDepartments();

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
        /// Peticion para obtener municipios por departamento
        /// </summary>
        /// <returns></returns>
        //[AuthorizeRoles(Rol.Administrator)]
        [ProducesResponseType(200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [AllowAnonymous]

        [HttpGet]
        public IActionResult GetMunicipalitys(int idDepartment)
        {
            try
            {
                var resp = _adressServices.GetMunicipalitys(idDepartment);

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
