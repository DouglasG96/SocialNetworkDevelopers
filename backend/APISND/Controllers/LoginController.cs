using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SNDAPI.DTO;
using SNDAPI.Exceptions;
using SNDAPI.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SNDAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]/v1/[action]")]
    public class LoginController : ControllerBase
    {
        private readonly IUser _user;

        public LoginController(IUser user)
        {
            _user = user;
        }


        [HttpPost]
        [ProducesResponseType(typeof(string), 200)]
        [ProducesResponseType(401)]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] UserDTO user)
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
                return StatusCode(500);
            }
        }
    }
}
