using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class OrdenesVenta
    {
        public OrdenesVenta()
        {
            OrdenesVentasDetalles = new HashSet<OrdenesVentasDetalle>();
        }

        public int IdOrdenVenta { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public string EstadoOrdenVenta { get; set; }
        public DateTime? FechaHoraOrdenVenta { get; set; }
        public decimal? TotalVentaConIva { get; set; }
        public decimal? TotalVentaSinIva { get; set; }

        public virtual Publicacione IdPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
        public virtual ICollection<OrdenesVentasDetalle> OrdenesVentasDetalles { get; set; }
    }
}
