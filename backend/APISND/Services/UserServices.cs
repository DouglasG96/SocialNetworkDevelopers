using APISND.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SNDAPI.DTO;
using SNDAPI.Exceptions;
using SNDAPI.Interface;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace SNDAPI.Services
{
    public class UserServices : IUser
    {
        private readonly SocialNetworkDeveloperContext _context;
        private IConfiguration _configuration;

        public UserServices(SocialNetworkDeveloperContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public async Task<string> Login(UserDTO userDTO)
        {
            var user = await _context.Usuarios.FirstOrDefaultAsync(x => x.CorreoElectronico == userDTO.Email && x.Contrasena == userDTO.Password);
            if (user == null)
                throw new UserNotFoundException($"Login Credenciales Incorrectas.");
            var jwt = GenerateJwt(user);
            return jwt ; 
        }

        private string GenerateJwt(Usuario user)
        {
            //creo token y clain
            var claims = new[] 
            {
                new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                new Claim(ClaimTypes.NameIdentifier,user.IdUsuario.ToString()),
                new Claim(ClaimTypes.Role,user.IdRol.ToString()),
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

            var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_configuration["Jwt:Issuer"], _configuration["Jwt:Audience"], claims, expires: DateTime.Now.AddHours(24), signingCredentials: signIn);
            return new JwtSecurityTokenHandler().WriteToken(token);
            //var key = _configuration["Jwt:Key"]; //_configuration.GetValue<string>("jwt-signing-key");
            //var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            //var signinCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);
            //var tokenOptions = new JwtSecurityToken(
            //    issuer: _configuration["Jwt:Issuer"],
            //    audience: _configuration["Jwt:Audience"],
            //    claims: new List<Claim>
            //    {
            //        new Claim(ClaimTypes.NameIdentifier,user.IdUsuario.ToString()),
            //        new Claim(ClaimTypes.Role,user.IdRol.ToString()),
            //    },
            //    expires: DateTime.Now.AddHours(24),
            //    signingCredentials: signinCredentials
            //);

            //return new JwtSecurityTokenHandler().WriteToken(tokenOptions);
        }
    }
}
