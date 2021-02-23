using System;
using System.Collections.Generic;

#nullable disable

namespace SNDAPI.Models
{
    public partial class TipoPublicacion
    {
        public TipoPublicacion()
        {
            Publicaciones = new HashSet<Publicacione>();
        }

        public int IdTipoPublicacion { get; set; }
        public string TipoPublicacion1 { get; set; }

        public virtual ICollection<Publicacione> Publicaciones { get; set; }
    }
}
