using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class OrdenesVenta
    {
        public OrdenesVenta()
        {
            OrdenesCompras = new HashSet<OrdenesCompra>();
        }

        public int IdOrdenVenta { get; set; }
        public int? IdPublicacion { get; set; }
        public int? EstadoOrdenVenta { get; set; }
        public DateTime? FechaHoraOrdenVenta { get; set; }
        public decimal? TotalVenta { get; set; }
        public int? Cantidad { get; set; }

        public virtual Publicacione IdPublicacionNavigation { get; set; }
        public virtual ICollection<OrdenesCompra> OrdenesCompras { get; set; }
    }
}
