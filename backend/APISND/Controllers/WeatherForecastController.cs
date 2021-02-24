using APISND;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SNDAPI.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace SNDAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [AuthorizeRoles(Rol.Customer)]
        [HttpGet]
        public IEnumerable<WeatherForecast> GetUserData()
        {
            var rng = new Random();
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();
        }

        [AuthorizeRoles(Rol.Administrator)]
        [HttpGet]
        public IActionResult GetAdminData()
        {
            try
            {
                var role = User.Claims.First(x => x.Type == ClaimTypes.Role).Value;
                var userId = User.Claims.First(x => x.Type == ClaimTypes.NameIdentifier).Value;
                var text = $"Hello from DataController. Only users above admin can access this endpoint. Your role is {role} with id {userId}.";
                return Ok(text);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
