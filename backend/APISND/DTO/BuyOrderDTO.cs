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
        public string Cantidad { get; set; }
        public string FechaHoraOrdenCompra { get; set; }
        public string TotalCompraConIva { get; set; }
        public string TotalCompraSinIva { get; set; }
        public string EstadoOrdenCompra { get; set; }
    }
}
