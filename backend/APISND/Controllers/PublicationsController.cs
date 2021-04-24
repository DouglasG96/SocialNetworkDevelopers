using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class PublicationsController : ControllerBase
    {
        private readonly IPublication _publicationServices;
        private readonly IMapper _mapper;

        public PublicationsController(IPublication publication, IMapper mapper)
        {
            _publicationServices = publication;
            _mapper = mapper;
        }

        /// <summary>
        /// obtiene todas las publicaciones(productos)
        /// </summary>
        /// <returns></returns>
        [ProducesResponseType(typeof(PublicationDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpGet]
        public async Task<IActionResult> GetPublications()
        {
            try
            {
                var resp = _mapper.Map<List<PublicationDTO>>(await _publicationServices.GetPublications());

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
        [ProducesResponseType(typeof(PublicationDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpGet("{id}")]
        public async Task<IActionResult> GetPublicationById(int id)
        {
            try
            {
                var resp = _mapper.Map<PublicationDTO>(await _publicationServices.GetPublicationById(id));

                if (resp == null)
                    return NotFound(new { message = $"Publicacion con Id = {id} no encontrado" });

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        /// <summary>
        /// Peticion para agregar un usuario
        /// <returns></returns>
        /// </summary>
        /// <param name="userDTO"></param>
        //[AuthorizeRoles(Rol.Administrator)]
        [HttpPost]
        [ProducesResponseType(typeof(PublicationDTO), 201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> AddPublication([FromForm] PublicationDTO publicationDTO)
        {
            try
            {
                using(var ms = new MemoryStream())
                {
                    await publicationDTO.file.CopyToAsync(ms);
                    publicationDTO.Imagen = ms.ToArray();
                }
                publicationDTO.FechaCreacion = DateTime.Now;
                publicationDTO.FechaPublicacion = DateTime.Now;
                var publication = _mapper.Map<Publicacione>(publicationDTO);
                var resp = await _publicationServices.AddPublication(publication);

                if (resp == null)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                //return StatusCode(StatusCodes.Status201Created, user);
                //return CreatedAtAction(nameof(GetUserByID), new { id = user.IdUsuario }, userDTO);
                return StatusCode(StatusCodes.Status201Created, publication);


            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }

        [HttpPut]
        public async Task<IActionResult> UpdatePublication(int id, [FromBody] PublicationDTO publicationDTO)
        {
            try
            {
                if (id != publicationDTO.IdPublicacion)
                    return BadRequest();

                if (!_publicationServices.PublicationExists(id))
                    return NotFound(new { message = $"Publicacion con Id = {id} no existe" });

                var publication = _mapper.Map<Publicacione>(publicationDTO);
                await _publicationServices.UpdatePublication(publication);

                return StatusCode(StatusCodes.Status204NoContent, publication);

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
                if (!_publicationServices.PublicationExists(id))
                    return NotFound(new { message = $"Publicacion con Id = {id} no existe" });

                await _publicationServices.DeletePublication(id);

                return NoContent();
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }
    }
}
