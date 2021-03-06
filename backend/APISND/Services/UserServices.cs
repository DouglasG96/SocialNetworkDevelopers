﻿using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using log4net;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Services
{
    public class UserServices : IUser
    {
        static readonly ILog log = LogManager.GetLogger(typeof(UserServices));

        private readonly SocialNetworkDeveloperContext _context;
        private readonly IMapper _mapper;

        public UserServices(SocialNetworkDeveloperContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public  List<Usuario> GetUsers()
        {
            try
            {
                return  _context.Usuarios.ToList();
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Usuarios GetUsers()  {0} : {1} ", e.Source, e.Message);
                throw;

            }
        }

        public async Task<Usuario> GetUserByID(int id)
        {
            try
            {
                return await _context.Usuarios.FirstOrDefaultAsync(x => x.IdUsuario == id);
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Usuario GetUserByID()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<Usuario> AddUser(Usuario user)
        {
            try
            {
                _context.Usuarios.Add(user);
                await _context.SaveChangesAsync();
                return user;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Crear Usuario AddUser()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<Usuario> UpdateUser(Usuario user)
        {
            try
            {
                var model = await _context.Usuarios.AsNoTracking().FirstOrDefaultAsync(x => x.IdUsuario == user.IdUsuario);
                if(model != null)
                {
                    _context.Update(user).State = EntityState.Modified;
                    await _context.SaveChangesAsync();

                    return user;
                }
                return null;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al  Actualizar Usuario UpdateUser()  {0} : {1} ", e.Source, e.Message);

                throw;
            }
        }

        public async Task<Usuario> DeleteUser(int id)
        {
            try
            {
                var user = await _context.Usuarios.FirstOrDefaultAsync(x => x.IdUsuario == id);
                if (user != null)
                {
                    _context.Usuarios.Remove(user);
                    await _context.SaveChangesAsync();
                    return user;
                }
                return null;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Eliminar Usuario DeleteUser()  {0} : {1} ", e.Source, e.Message);
                throw;
            }

        }
        public bool UserExists(int id)
        {
            try
            {
                return _context.Usuarios.AsNoTracking().Any(x => x.IdUsuario == id);
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Validar si Existe Usuario UserExists()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<bool> UserExistsEmail(string email)
        {
            try
            {
                return await _context.Usuarios.AsNoTracking().AnyAsync(x => x.CorreoElectronico == email);
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Validar si Existe Usuario por medio de email UserExistsEmail()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<bool> UpdatePassword(UserPasswordDTO userPasswordDTO)
        {
            try
            {
                var user = await _context.Usuarios.FirstOrDefaultAsync(x => x.CorreoElectronico == userPasswordDTO.Email);
                if (user != null)
                {
                    user.Contrasena = userPasswordDTO.Password;
                    _context.Update(user).State = EntityState.Modified;
                    await _context.SaveChangesAsync();

                    return true;
                }
                return false;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al  Actualizar Contraseña UpdatePassword()  {0} : {1} ", e.Source, e.Message);
                return false;
                throw;
            }
        }
    }
}
