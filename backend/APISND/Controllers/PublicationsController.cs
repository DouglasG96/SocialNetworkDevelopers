﻿using APISND.DTO;
using APISND.Helpers;
using APISND.Hubs;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
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
        private readonly IHubContext<PublicationHub> _hubContext;



        public PublicationsController(IPublication publication, IMapper mapper, IHubContext<PublicationHub> hubContext)
        {
            _publicationServices = publication;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        /// <summary>
        /// obtiene todas las publicaciones(productos)
        /// </summary>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Buyer)]
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

        /// <summary>
        /// Petición para obtener datos de una publicacion por Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Buyer, Rol.Seller)]
        [ProducesResponseType(typeof(PublicationDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpGet("{id}")]
        public async Task<IActionResult> GetPublicationById(int id)
        {
            try
            {
                var resp = await _publicationServices.GetPublicationById(id);

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
        /// Publicacion para obtener las publicaciones de un usuario
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>

        //[AuthorizeRoles(Rol.Buyer, Rol.Seller)]
        [ProducesResponseType(typeof(PublicationDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpGet]
        public async Task<IActionResult> GetPublicationByIdUser(int idUser)
        {
            try
            {
                var resp = await _publicationServices.GetPublicationByIdUser(idUser);

                if (resp == null)
                    return NotFound(new { message = $"Usuario con Id = {idUser} no encontrado" });

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }
        /// <summary>
        /// Petición para agregar una nueva publicación
        /// </summary>
        /// <param name="publicationDTO"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Seller)]
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
                //publicationDTO.FechaCreacion = DateTime.Now;
                //publicationDTO.FechaPublicacion = DateTime.Now;
                var publication = _mapper.Map<Publicacione>(publicationDTO);
                var resp = await _publicationServices.AddPublication(publication);

                if (resp == null)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                //return StatusCode(StatusCodes.Status201Created, user);
                //return CreatedAtAction(nameof(GetUserByID), new { id = user.IdUsuario }, userDTO);
                await _hubContext.Clients.All.SendAsync("NewPublication", publication.Titulo);

                return StatusCode(StatusCodes.Status201Created, publication);


            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }


        /// <summary>
        /// Petición para actualizar una publicación
        /// </summary>
        /// <param name="id"></param>
        /// <param name="publicationDTO"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Seller, Rol.Buyer)]
        [ProducesResponseType(201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpPut]
        public async Task<IActionResult> UpdatePublication(int id, [FromBody] UpdatePublicationDTO publicationDTO)
        {
            try
            {
                if (id != publicationDTO.IdPublicacion)
                    return BadRequest();

                if (!_publicationServices.PublicationExists(id))
                    return NotFound(new { message = $"Publicacion con Id = {id} no existe" });

                //var publication = _mapper.Map<Publicacione>(publicationDTO);
                await _publicationServices.UpdatePublication(publicationDTO);

                return StatusCode(StatusCodes.Status204NoContent, publicationDTO);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        /// <summary>
        /// Petición para Elimar una publicación
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Seller)]
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
