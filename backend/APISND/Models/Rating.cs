using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Rating
    {
        public int IdRating { get; set; }
        public int? Rating1 { get; set; }
        public DateTime? FechaHoraCreacion { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }

        public virtual Publicacione IdPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
