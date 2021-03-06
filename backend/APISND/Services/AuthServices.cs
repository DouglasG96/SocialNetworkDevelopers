﻿using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SNDAPI.Exceptions;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace SNDAPI.Services
{
    public class AuthServices : IAuth
    {
        private readonly SocialNetworkDeveloperContext _context;
        private IConfiguration _configuration;

        public AuthServices(SocialNetworkDeveloperContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        public async Task<string> Login(AuthDTO userDTO)
        {
            try
            {
                var user = await _context.Usuarios.FirstOrDefaultAsync(x => x.CorreoElectronico == userDTO.Email && x.Contrasena == userDTO.Password);
                if (user == null)
                    throw new UserNotFoundException($"Credenciales Incorrectas.");
                var jwt = GenerateJwt(user);
                return jwt ; 
            }
            catch (Exception e)
            {

                throw;
            }
        }

        private string GenerateJwt(Usuario user)
        {

            //var key = _configuration.GetValue<string>("jwt-signing-key");
            //var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
            //var signinCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);
            //var tokenOptions = new JwtSecurityToken(
            //    issuer: "SNDAuthenticationServer",
            //    audience: "SND",
            //    claims: new List<Claim>
            //    {
            //        new Claim(ClaimTypes.NameIdentifier,user.IdUsuario.ToString()),
            //        new Claim(ClaimTypes.Role,user.IdRol.ToString()),
            //        new Claim("idUser",user.IdUsuario.ToString()),
            //        new Claim("idRole",user.IdRol.ToString()),
            //        new Claim("nameUser",user.NombreCompleto.ToString()),
            //        new Claim("dui",user.Dui.ToString()),
            //        new Claim("nit",user.Nit.ToString()),
            //        new Claim("phone",user.TelefonoContacto.ToString()),
            //        new Claim("email",user.CorreoElectronico.ToString()),
            //    },
            //    expires: DateTime.Now.AddHours(24),
            //    signingCredentials: signinCredentials
            //);

            //return new JwtSecurityTokenHandler().WriteToken(tokenOptions);


            //creo token y clain
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
                //new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                new Claim(ClaimTypes.Role,user.IdRol.ToString()),
                new Claim("idUser",user.IdUsuario.ToString()),
                new Claim("idRole",user.IdRol.ToString()),
                new Claim("nameUser",user.NombreCompleto.ToString()),
                new Claim("dui",user.Dui.ToString()),
                new Claim("nit",user.Nit.ToString()),
                new Claim("phone",user.TelefonoContacto.ToString()),
                new Claim("email",user.CorreoElectronico.ToString()),
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

            var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(issuer: "SNDAuthenticationServer", audience: "SND", claims, expires: DateTime.Now.AddDays(5), signingCredentials: signIn);
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
