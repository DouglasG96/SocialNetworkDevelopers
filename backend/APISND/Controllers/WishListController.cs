using APISND.DTO;
using APISND.Helpers;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
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
    public class WishlistController : ControllerBase
    {
        private readonly IWishList _wishlist;
        private readonly IMapper _mapper;
        public WishlistController(IWishList wishList, IMapper mapper)
        {
            _wishlist = wishList;
            _mapper = mapper;
        }

        [HttpGet]
        [ProducesResponseType(typeof(WishlistDTO), 200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(500)]
        public IActionResult GetPublicationWishList(int idUser)
        {
            try
            {
                var resp = _wishlist.GetPublicationWishList(idUser);

                if (resp == null)
                    return NotFound(resp);

                return Ok(resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = e.Message });
            }
        }

        //[AuthorizeRoles(Rol.Buyer)]
        [HttpPost]
        [ProducesResponseType(typeof(WishlistDTO), 201)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> AddPublicationWishList([FromBody] WishlistDTO wishlistDTO)
        {
            try
            {
                var wishlist = _mapper.Map<Whislist>(wishlistDTO);
                var resp = await _wishlist.AddPublicationWishList(wishlist);

                if (resp == null)
                    return StatusCode(StatusCodes.Status404NotFound, resp);
                return CreatedAtAction(nameof(GetPublicationWishList), new { id = wishlist }, wishlistDTO);

            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }

        //[AuthorizeRoles(Rol.Buyer)]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(401)]
        [ProducesResponseType(404)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> DeletePublicationWishlist(int idWishList)
        {
            try
            {
                bool resp = await _wishlist.DeletePublicationWishlist(idWishList);
                if (!resp)
                    return StatusCode(StatusCodes.Status404NotFound, resp);

                return StatusCode(StatusCodes.Status200OK, resp);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e.Message);
            }
        }
    }
}
