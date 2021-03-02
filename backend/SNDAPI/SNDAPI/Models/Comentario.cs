using System;
using System.Collections.Generic;

#nullable disable

namespace SNDAPI.Models
{
    public partial class Comentario
    {
        public int IdComentario { get; set; }
        public int? Comentario1 { get; set; }
        public int? IdTipoComentario { get; set; }
        public int? IdComentarioPrincipal { get; set; }
        public int? IdEstadoComentario { get; set; }

        public virtual EstadoComentario IdEstadoComentarioNavigation { get; set; }
        public virtual TipoComentario IdTipoComentarioNavigation { get; set; }
    }
}
