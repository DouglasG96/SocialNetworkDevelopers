using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class UpdatePublicationDTO
    {
        public int IdPublicacion { get; set; }
        public string Titulo { get; set; }
        public int? Raiting { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? IdCategoria { get; set; }
        public int? IdSubCategoria { get; set; }
        public int? IdTipoPublicacion { get; set; }
        public int? IdDepartamento { get; set; }
        public int? IdMunicipio { get; set; }
        public decimal? Precio { get; set; }
        public int? IdEstadoPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public string Delivery { get; set; }
    }
}
