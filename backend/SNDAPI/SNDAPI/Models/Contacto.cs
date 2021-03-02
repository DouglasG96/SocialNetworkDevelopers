using System;
using System.Collections.Generic;

#nullable disable

namespace SNDAPI.Models
{
    public partial class Contacto
    {
        public int IdContacto { get; set; }
        public int? IdUsuario { get; set; }
        public int? IdUsuarioContacto { get; set; }
        public int? Estado { get; set; }

        public virtual Usuario IdUsuarioContactoNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
