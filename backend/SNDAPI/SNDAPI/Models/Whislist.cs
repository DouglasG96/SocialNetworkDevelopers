using System;
using System.Collections.Generic;

#nullable disable

namespace SNDAPI.Models
{
    public partial class Whislist
    {
        public int IdWhislist { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public DateTime? FechaCreacion { get; set; }

        public virtual Publicacione IdPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
