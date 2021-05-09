using APISND.DTO;
using APISND.Helpers;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APISND.Controllers
{
    [Route("api/v1/[controller]/[action]")]
    [ApiController]
    public class BuyOrdersController : ControllerBase
    {
        private readonly IBuyOrder _buyOrderServices;
        private readonly IMapper _mapper;
        public BuyOrdersController(IBuyOrder buyOrder, IMapper mapper)
        {
            _buyOrderServices = buyOrder;
            _mapper = mapper;
        }

        /// <summary>
        /// Petición para obtener historico de compras por usuario
        /// </summary>
        /// <param name="idBuyer"></param>
        /// <returns></returns>
        [HttpGet]
        [AuthorizeRoles(Rol.Buyer)]
        [ProducesResponseType(typeof(BuyOrderDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public IActionResult GetHistoryBuysByIdBuyer(int idBuyer)
        {
            try
            {
                var resp = _buyOrderServices.GetHistoryBuysByIdBuyer(idBuyer);

                if (resp == null)
                    return NotFound(resp);

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        [AuthorizeRoles(Rol.Buyer)]
        [ProducesResponseType(201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        [HttpPut]
        public async Task<IActionResult> ReceivedBuyer(ReceivedBuyerDTO receivedBuyerDTO)
        {
            try
            {
                var resp = await _buyOrderServices.ReceivedBuyer(receivedBuyerDTO);

                if (!resp)
                    return NotFound(resp);

                return StatusCode(StatusCodes.Status204NoContent, resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        [HttpGet]
        [AuthorizeRoles(Rol.Administrator)]
        [ProducesResponseType(typeof(BuySummaryDTO), 200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public IActionResult GetBuySummary()
        {
            try
            {
                var resp = _buyOrderServices.GetBuySummary();

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
