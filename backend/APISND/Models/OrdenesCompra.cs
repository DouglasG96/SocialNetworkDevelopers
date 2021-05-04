using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class OrdenesCompra
    {
        public int IdOrdenCompra { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public DateTime? FechaHoraOrdenCompra { get; set; }
        public decimal? TotalCompra { get; set; }
        public int? EstadoOrdenCompra { get; set; }
        public int? Cantidad { get; set; }

        public virtual Publicacione IdPublicacionNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
