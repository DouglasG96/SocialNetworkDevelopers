﻿using APISND.Models;
using APISND.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IWishList
    {
        List<WishlistDTO> GetPublicationWishList(int idUsuario);
        Task<Wishlist> AddPublicationWishList(Wishlist wishlist);
        Task<bool> DeletePublicationWishlist(int idWishList);
    }
}
