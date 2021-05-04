using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class WishlistDTO
    {
        public int idWhislist { get; set; }
        public int idPublicacion { get; set; }
        public int idUsuario{ get; set; }
        public string FechaCreacion { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int Estado{ get; set; }
    }
}
