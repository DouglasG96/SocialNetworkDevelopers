using APISND.DTO;
using APISND.Helpers;
using APISND.Hubs;
using APISND.Interface;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class SaleOrdersController : ControllerBase
    {
        private readonly ISaleOrder _saleOrderServices;
        private readonly IMapper _mapper;
        private readonly IHubContext<PublicationHub> _hubContext;



        public SaleOrdersController(ISaleOrder saleOrder, IMapper mapper, IHubContext<PublicationHub> hubContext)
        {
            _saleOrderServices = saleOrder;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        /// <summary>
        /// Petición para obterner historico de ventas por vendedor
        /// </summary>
        /// <param name="idSeller"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Seller)]
        [HttpGet]
        [ProducesResponseType(typeof(SaleOrderDTO), 200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(500)]
        public IActionResult GetHistorySalesByIdSeller(int idSeller)
        {
            try
            {
                var resp =  _saleOrderServices.GetHistorySalesByIdSeller(idSeller);

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
        /// Peticion para crear una orden de compra / comprar una publicación
        /// </summary>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Buyer)]
        [HttpPost]
        [ProducesResponseType( 200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> AddSale(SaleOrderDTO saleOrderDTO)
        {
            try
            {
                bool resp = await _saleOrderServices.AddSale(saleOrderDTO);
                if(!resp)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                    
                return StatusCode(StatusCodes.Status201Created, saleOrderDTO);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }

        /// <summary>
        ///Petición para Aprobar Orden de Compra 
        /// </summary>
        /// <param name="statusOrderDTO"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Seller)]
        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> AprovveSale(StatusOrderDTO statusOrderDTO)
        {
            try
            {
                bool resp = await _saleOrderServices.AprovveSale(statusOrderDTO);
                if (!resp)
                    return StatusCode(StatusCodes.Status404NotFound, resp);

                return StatusCode(StatusCodes.Status200OK, resp);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }
        /// <summary>
        /// Petición para Rechazar Orden de Compra
        /// </summary>
        /// <param name="statusOrderDTO"></param>
        /// <returns></returns>
        [AuthorizeRoles(Rol.Seller)]
        [HttpPost]
        [ProducesResponseType(200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> RejectSale(StatusOrderDTO statusOrderDTO)
        {
            try
            {
                bool resp = await _saleOrderServices.RejectSale(statusOrderDTO);
                if (!resp)
                    return StatusCode(StatusCodes.Status404NotFound, resp);

                return StatusCode(StatusCodes.Status200OK, resp);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }
    }
}
