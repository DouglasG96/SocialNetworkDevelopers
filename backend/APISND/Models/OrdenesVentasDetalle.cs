using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class OrdenesVentasDetalle
    {
        public int IdOrdenVentaDetalle { get; set; }
        public int? IdOrdenVenta { get; set; }
        public decimal? Cantidad { get; set; }
        public int? EstadoOrdenNegocioDetalle { get; set; }
        public decimal? MontoConIva { get; set; }
        public decimal? MontoSinIva { get; set; }

        public virtual OrdenesVenta IdOrdenVentaNavigation { get; set; }
    }
}
