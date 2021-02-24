using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class TipoComentario
    {
        public TipoComentario()
        {
            Comentarios = new HashSet<Comentario>();
        }

        public int IdTipoComentario { get; set; }
        public string Tipo { get; set; }

        public virtual ICollection<Comentario> Comentarios { get; set; }
    }
}
