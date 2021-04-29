using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class BuyOrderDTO
    {
        public int IdOrdenCompra { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public string FechaHoraOrdenVenta { get; set; }

        public decimal? TotalCompraConIva { get; set; }
        public decimal? TotalCompraSinIva { get; set; }
        public string EstadoOrdenCompra { get; set; }
        public int? Cantidad { get; set; }
        public string TituloPublicacion { get; set; }

    }
}
