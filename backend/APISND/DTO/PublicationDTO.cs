using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class PublicationDTO
    {
        public int IdPublicacion { get; set; }
        public string Titulo { get; set; }
        public string RutaImagen { get; set; }
        public int? Raiting { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaPublicacion { get; set; }
        public int? IdSubCategoria { get; set; }
        public int? IdTipoPublicacion { get; set; }
        public int? IdMinicipio { get; set; }
        public string Descripcion { get; set; }
        public decimal? Precio { get; set; }
        public int? IdEstadoPublicacion { get; set; }
        public int? IdUsuario { get; set; }
    }
}
