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
            Ratings = new HashSet<Rating>();
            Wishlists = new HashSet<Wishlist>();
        }

        public int IdPublicacion { get; set; }
        public string Titulo { get; set; }
        public byte[] Imagen { get; set; }
        public int? Raiting { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? IdCategoria { get; set; }
        public DateTime? FechaPublicacion { get; set; }
        public int? IdSubCategoria { get; set; }
        public int? IdTipoPublicacion { get; set; }
        public int? IdDepartamento { get; set; }
        public int? IdMunicipio { get; set; }
        public string Descripcion { get; set; }
        public decimal? Precio { get; set; }
        public int? IdEstadoPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public string Delivery { get; set; }

        public virtual Departamento IdDepartamentoNavigation { get; set; }
        public virtual EstadoPublicacion IdEstadoPublicacionNavigation { get; set; }
        public virtual Municipio IdMunicipioNavigation { get; set; }
        public virtual SubCategoria IdSubCategoriaNavigation { get; set; }
        public virtual TipoPublicacion IdTipoPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
        public virtual ICollection<OrdenesCompra> OrdenesCompras { get; set; }
        public virtual ICollection<OrdenesVenta> OrdenesVenta { get; set; }
        public virtual ICollection<Rating> Ratings { get; set; }
        public virtual ICollection<Wishlist> Wishlists { get; set; }
    }
}
