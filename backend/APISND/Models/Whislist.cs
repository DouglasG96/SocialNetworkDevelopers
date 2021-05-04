using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Whislist
    {
        public int IdWhislist { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? EstadoWishlist { get; set; }

        public virtual Publicacione IdPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
