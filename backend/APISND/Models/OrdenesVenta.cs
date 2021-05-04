using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class OrdenesVenta
    {
        public int IdOrdenVenta { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public int? EstadoOrdenVenta { get; set; }
        public DateTime? FechaHoraOrdenVenta { get; set; }
        public decimal? TotalVenta { get; set; }
        public int? Cantidad { get; set; }

        public virtual Publicacione IdPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
