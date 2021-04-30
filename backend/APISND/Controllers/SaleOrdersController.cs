using APISND.DTO;
using APISND.Helpers;
using APISND.Interface;
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
    public class SaleOrdersController : ControllerBase
    {
        private readonly ISaleOrder _saleOrderServices;
        private readonly IMapper _mapper;


        public SaleOrdersController(ISaleOrder saleOrder, IMapper mapper)
        {
            _saleOrderServices = saleOrder;
            _mapper = mapper;
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
    }
}
