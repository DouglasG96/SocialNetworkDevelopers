using System;
using System.Collections.Generic;

#nullable disable

namespace SNDAPI.Models
{
    public partial class Chat
    {
        public int IdChat { get; set; }
        public int? IdUsuarioEmisor { get; set; }
        public int? IdUsuarioDestinatario { get; set; }

        public virtual Usuario IdUsuarioDestinatarioNavigation { get; set; }
        public virtual Usuario IdUsuarioEmisorNavigation { get; set; }
    }
}
