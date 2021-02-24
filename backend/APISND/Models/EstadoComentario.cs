using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class EstadoComentario
    {
        public EstadoComentario()
        {
            Comentarios = new HashSet<Comentario>();
        }

        public int IdEstadoComentario { get; set; }
        public string Estado { get; set; }

        public virtual ICollection<Comentario> Comentarios { get; set; }
    }
}
