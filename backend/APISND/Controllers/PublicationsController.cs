using APISND.DTO;
using APISND.Interface;
using AutoMapper;
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
    public class PublicationsController : ControllerBase
    {
        private readonly IPublication _publicationServices;
        private readonly IMapper _mapper;

        public PublicationsController(IPublication publication, IMapper mapper)
        {
            _publicationServices = publication;
            _mapper = mapper;
        }

        [ProducesResponseType(typeof(PublicationDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpGet]
        public IActionResult GetPublications()
        {
            try
            {
                var resp = _mapper.Map<List<PublicationDTO>>(_publicationServices.GetPublications());

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
