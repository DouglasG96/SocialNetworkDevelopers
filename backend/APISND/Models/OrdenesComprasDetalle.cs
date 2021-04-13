using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class OrdenesComprasDetalle
    {
        public int IdOrdenCompraDetalle { get; set; }
        public int? IdOrdenCompra { get; set; }
        public decimal? Cantidad { get; set; }
        public decimal? MontoConIva { get; set; }
        public decimal? MontoSinIva { get; set; }
        public int? EstadoOrdenCompraDetalle { get; set; }

        public virtual OrdenesCompra IdOrdenCompraNavigation { get; set; }
    }
}
