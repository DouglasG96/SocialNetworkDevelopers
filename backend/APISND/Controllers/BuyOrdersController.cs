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
using System.Net;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APISND.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class BuyOrdersController : ControllerBase
    {
        private readonly IBuyOrder _buyOrder;
        private readonly IMapper _mapper;
        public BuyOrdersController(IBuyOrder buyOrder, IMapper mapper)
        {
            _buyOrder = buyOrder;
            _mapper = mapper;
        }
        [HttpGet]
        [ProducesResponseType(typeof(BuyOrderDTO), 200)]
        [AllowAnonymous]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public IActionResult GetHistoryBuysByIdBuyer(int idBuyer)
        {

            try
            {
                var resp = _mapper.Map<List<BuyOrderDTO>>(_buyOrder.GetHistoryBuysByIdBuyer(idBuyer));
                if (resp == null)
                    return NotFound(resp);

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }
        /*

        /// <summary>
        /// Peticion para agregar un usuario
        /// </summary>
        /// <param name="userDTO"></param>
        /// <returns></returns>
        //[AuthorizeRoles(Rol.Administrator)]
        [HttpPost]
        [ProducesResponseType(typeof(UserDTO), 201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> AddUser([FromBody] UserDTO userDTO)
        {
            try
            {
                var user = _mapper.Map<Usuario>(userDTO);
                var resp = await _buyOrder.AddUser(user);

                if (resp == null)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                //return StatusCode(StatusCodes.Status201Created, user);
                return CreatedAtAction(nameof(GetUserByID), new { id = user.IdUsuario }, userDTO);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }

        //[AuthorizeRoles(Rol.Administrator)]
        [HttpPut("{id}")]
        [ProducesResponseType(typeof(UserDTO), 204)]
        [ProducesResponseType(400)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> UpdateUser(int id, [FromBody] UserDTO userDTO)
        {
            try
            {
                if (id != userDTO.IdUsuario)
                    return BadRequest();

                if (!_buyOrder.UserExists(id))
                    return NotFound(new { message = $"Usuario con Id = {id} no existe" } );

                var user = _mapper.Map<Usuario>(userDTO);
                await _buyOrder.UpdateUser(user);

                return StatusCode(StatusCodes.Status204NoContent, user);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }


        //[AuthorizeRoles(Rol.Administrator)]
        [ProducesResponseType(204)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            try
            {
                if (!_buyOrder.UserExists(id))
                    return NotFound(new { message = $"Usuario con Id = {id} no existe" });

                await _buyOrder.DeleteUser(id);

                return NoContent();
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }
        */
    }
}
