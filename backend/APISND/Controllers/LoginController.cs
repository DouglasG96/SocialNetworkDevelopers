using APISND.DTO;
using APISND.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SNDAPI.Exceptions;
using SNDAPI.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]/[action]")]
    public class LoginController : ControllerBase
    {
        private readonly IAuth _user;

        public LoginController(IAuth user)
        {
            _user = user;
        }


        [HttpPost]
        [ProducesResponseType(typeof(string), 200)]
        [ProducesResponseType(401)]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] AuthDTO user)
        {
            try
            {
                var jwt = await _user.Login(user);
                return Ok(jwt);
            }
            catch (UserNotFoundException e)
            {
                return StatusCode(StatusCodes.Status404NotFound, e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }
    }
}
