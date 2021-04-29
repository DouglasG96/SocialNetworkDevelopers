using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class SaleOrderDTO
    {
        public int IdOrdenVenta { get; set; }
        public int? IdPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public string EstadoOrdenVenta { get; set; }
        public string FechaHoraOrdenVenta { get; set; }
        public decimal? TotalVentaConIva { get; set; }
        public decimal? TotalVentaSinIva { get; set; }
        public int Cantidad { get; set; }
        public int IdComprador { get; set; }
        public int IdOrdenCompra { get; set; }
        public string DireccionEntrega { get; set; }
        public string Comentario { get; set; }
        public string TituloPublicacion { get; set; }
        public string Comprador { get; set; }


    }
}
