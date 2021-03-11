using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Chat
    {
        public int IdChat { get; set; }
        public int? IdUsuarioEmisor { get; set; }
        public int? IdUsuarioDestinatario { get; set; }
        public string Mensaje { get; set; }
        public int? EstadoMensaje { get; set; }
        public int? EstadoChat { get; set; }

        public virtual Usuario IdUsuarioDestinatarioNavigation { get; set; }
        public virtual Usuario IdUsuarioEmisorNavigation { get; set; }
    }
}
