using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Publicacione
    {
        public Publicacione()
        {
            Whislists = new HashSet<Whislist>();
        }

        public int IdPublicacion { get; set; }
        public string Titulo { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaPublicacion { get; set; }
        public int? IdSubCategoria { get; set; }
        public int? IdTipoPublicacion { get; set; }
        public int? IdMinicipio { get; set; }
        public string Descripcion { get; set; }
        public decimal? Precio { get; set; }
        public int? IdEstadoPublicacion { get; set; }

        public virtual EstadoPublicacion IdEstadoPublicacionNavigation { get; set; }
        public virtual SubCategoria IdSubCategoriaNavigation { get; set; }
        public virtual TipoPublicacion IdTipoPublicacionNavigation { get; set; }
        public virtual ICollection<Whislist> Whislists { get; set; }
    }
}
