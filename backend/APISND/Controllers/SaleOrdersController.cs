using APISND.DTO;
using APISND.Interface;
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

        public SaleOrdersController(ISaleOrder saleOrder)
        {
            _saleOrderServices = saleOrder;
        }
        /// <summary>
        /// Peticion para crear una orden de compra
        /// </summary>
        /// <returns></returns>
        [HttpPost]
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
