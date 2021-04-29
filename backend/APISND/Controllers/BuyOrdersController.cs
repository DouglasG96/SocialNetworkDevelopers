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
        [ProducesResponseType(typeof(BuyOrderDTO), 200)]
        [AllowAnonymous]
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

    }
}
