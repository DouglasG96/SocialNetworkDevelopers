using APISND.DTO;
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
    public class WishlistServices : IWishList
    {
        static readonly ILog log = LogManager.GetLogger(typeof(WishlistServices));
        private readonly SocialNetworkDeveloperContext _context;
        private readonly IMapper _mapper;

        public WishlistServices(SocialNetworkDeveloperContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
       
        public List<WishlistDTO> GetPublicationWishList(int idUsuario)
        {
                try
                {
                    var list = (from wsh in _context.Wishlists
                                join pbl in _context.Publicaciones
                                on wsh.IdPublicacion equals pbl.IdPublicacion
                                join usr in _context.Usuarios
                                on pbl.IdUsuario equals usr.IdUsuario
                                where wsh.IdUsuario == idUsuario && wsh.EstadoWishlist == 1
                                orderby pbl.FechaPublicacion descending
                                select new WishlistDTO
                                {
                                    idWhislist = wsh.IdWhislist,
                                    idPublicacion = (int) wsh.IdPublicacion,
                                    idUsuario = (int) wsh.IdUsuario,
                                    FechaCreacion = Convert.ToDateTime(wsh.FechaCreacion).ToString("dd/MM/yyyy HH:mm:ss"),
                                    Titulo = pbl.Titulo,
                                    Descripcion = pbl.Descripcion,
                                    Precio = (decimal) pbl.Precio,
                                    Imagen = pbl.Imagen,
                                }).ToList();
                    return list;

                }
                catch (Exception e)
                {
                    log.ErrorFormat("Error al obtener datos de la wishlist del usuario GetPublicationWishList()  {0} : {1} ", e.Source, e.Message);
                    throw;
                }
        }

        public async Task<Wishlist> AddPublicationWishList(Wishlist wishlist)
        {
            try
            {
                _context.Wishlists.Add(wishlist);
                await _context.SaveChangesAsync();
                return wishlist;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al Crear Usuario AddPublicationWishList()  {0} : {1} ", e.Source, e.Message);
                throw;
            }

        }

        public async Task<bool> DeletePublicationWishlist(int idWishList)
        {

            try
            {
                var itemwishlistexist = await _context.Wishlists.FirstOrDefaultAsync(x => x.IdWhislist == idWishList);

                if (itemwishlistexist == null)
                    return false;

                itemwishlistexist.EstadoWishlist = 0; //eliminada
                _context.Wishlists.Add(itemwishlistexist).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {
                log.ErrorFormat("Error al ejecutar transaccion para eliminar item de una wishlist DeletePublicationWishlist()  {0} : {1} ", e.Source, e.Message);
                return false;
            }
        }

   }

}
