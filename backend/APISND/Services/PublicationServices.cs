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
    public class PublicationServices : IPublication
    {
        static readonly ILog log = LogManager.GetLogger(typeof(UserServices));
        private readonly SocialNetworkDeveloperContext _context;
        private readonly IMapper _mapper;

        public PublicationServices(SocialNetworkDeveloperContext context, IMapper mapper)
        {
            _context = context;
            this._mapper = mapper;
        }

        public async Task<List<Publicacione>> GetPublications()
        {
            try
            {
                return  await _context.Publicaciones.ToListAsync();
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Publicaciones GetPublications()  {0} : {1} ", e.Source, e.Message);
                throw;

            }
        }
        public async Task<PublicationDTO> GetPublicationById(int id)
        {
            try
            {
                //return await _context.Publicaciones.FirstOrDefaultAsync(x => x.IdPublicacion == id);
                var publication = await (from p in _context.Publicaciones
                                   join u in _context.Usuarios
                                   on p.IdUsuario equals u.IdUsuario
                                   where p.IdPublicacion == id
                                   select new PublicationDTO
                                   {
                                       IdPublicacion = p.IdPublicacion,
                                       Titulo = p.Titulo,
                                       Imagen = p.Imagen,
                                       Raiting = p.Raiting,
                                       Descripcion = p.Descripcion,
                                       FechaCreacion = p.FechaCreacion,
                                       Precio = p.Precio,
                                       IdUsuario = p.IdUsuario,
                                       IdEstadoPublicacion = p.IdEstadoPublicacion,
                                       Contribuyente = u.Contribuyente
                                   }).FirstOrDefaultAsync();
                return publication;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Publicacion GetPublicationById()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }
        public async Task<Publicacione> AddPublication(Publicacione publication)
        {
            try
            {
                publication.FechaCreacion = DateTime.Now;
                publication.FechaPublicacion = DateTime.Now;
                publication.Raiting = 0;
                _context.Publicaciones.Add(publication);
                await _context.SaveChangesAsync();
                return publication;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Crear Publicacion AddPublication()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<Publicacione> UpdatePublication(UpdatePublicationDTO model)
        {
            try
            {
                var publication = await _context.Publicaciones.FirstOrDefaultAsync(x => x.IdPublicacion == model.IdPublicacion);
                if (model != null)
                {
                    _mapper.Map(model, publication);
                    _context.Update(publication).State = EntityState.Modified;
                    await _context.SaveChangesAsync();

                    return publication;
                }
                return null;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Actualizar Publicacion UpdatePublication()  {0} : {1} ", e.Source, e.Message);

                throw;
            }
        }

        public async Task<Publicacione> DeletePublication(int id)
        {
            try
            {
                var publication = await _context.Publicaciones.FirstOrDefaultAsync(x => x.IdPublicacion == id);
                if (publication != null)
                {
                    _context.Publicaciones.Remove(publication);
                    await _context.SaveChangesAsync();
                    return publication;
                }
                return null;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Eliminar Publicacion DeletePublication()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public bool PublicationExists(int id)
        {
            try
            {
                return _context.Publicaciones.AsNoTracking().Any(x => x.IdPublicacion == id);
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Validar si Existe Publicacion PublicationExists()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }

        public async Task<List<PublicationDTO>> GetPublicationByIdUser(int idUser)
        {
            try
            {
                var data = await  (from p in _context.Publicaciones
                            where p.IdUsuario == idUser
                            orderby p.FechaPublicacion descending
                            select new PublicationDTO
                            {
                                IdPublicacion = p.IdPublicacion,
                                Titulo = p.Titulo,
                                FechaPublicacion = Convert.ToDateTime(p.FechaPublicacion).ToString("dd/MM/yyyy HH:mm:ss"),
                                Delivery = p.Delivery
                            }).ToListAsync();
                return data;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al obtener datos de Publicacion GetPublicationByIdUser()  {0} : {1} ", e.Source, e.Message);
                throw;
            }
        }
    }
}
