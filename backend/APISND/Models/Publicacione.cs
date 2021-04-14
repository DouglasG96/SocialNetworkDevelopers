using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Publicacione
    {
        public Publicacione()
        {
            OrdenesCompras = new HashSet<OrdenesCompra>();
            OrdenesVenta = new HashSet<OrdenesVenta>();
            Whislists = new HashSet<Whislist>();
        }

        public int IdPublicacion { get; set; }
        public string Titulo { get; set; }
        public byte[] Imagen { get; set; }
        public int? Raiting { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaPublicacion { get; set; }
        public int? IdSubCategoria { get; set; }
        public int? IdTipoPublicacion { get; set; }
        public int? IdMinicipio { get; set; }
        public string Descripcion { get; set; }
        public decimal? Precio { get; set; }
        public int? IdEstadoPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public string Delivery { get; set; }

        public virtual EstadoPublicacion IdEstadoPublicacionNavigation { get; set; }
        public virtual SubCategoria IdSubCategoriaNavigation { get; set; }
        public virtual TipoPublicacion IdTipoPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
        public virtual ICollection<OrdenesCompra> OrdenesCompras { get; set; }
        public virtual ICollection<OrdenesVenta> OrdenesVenta { get; set; }
        public virtual ICollection<Whislist> Whislists { get; set; }
    }
}
