using Microsoft.AspNetCore.Http;
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
        public byte[] Imagen { get; set; }
        public int? Raiting { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? IdCategoria { get; set; }
        public string FechaPublicacion { get; set; }
        public int? IdSubCategoria { get; set; }
        public int? IdTipoPublicacion { get; set; }
        public int? IdDepartamento { get; set; }
        public int? IdMunicipio { get; set; }
        public string Descripcion { get; set; }
        public decimal? Precio { get; set; }
        public int? IdEstadoPublicacion { get; set; }
        public int? IdUsuario { get; set; }
        public string Delivery { get; set; }
        public string Contribuyente { get; set; }
        public IFormFile file { get; set; }
    }
}
