using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class EstadoPublicacion
    {
        public EstadoPublicacion()
        {
            Publicaciones = new HashSet<Publicacione>();
        }

        public int IdEstadoPublicacion { get; set; }
        public string Estado { get; set; }

        public virtual ICollection<Publicacione> Publicaciones { get; set; }
    }
}
