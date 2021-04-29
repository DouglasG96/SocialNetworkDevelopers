using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class WishlistDTO
    {
        public int IdUsuario { get; set; }
        [Required]
        public int? IdRol { get; set; }
        [Required]
        public string NombreCompleto { get; set; }
        [Required]
        public string Nombres { get; set; }
        [Required]
        public string Apellidos { get; set; }
        public string Dui { get; set; }
        public string Nit { get; set; }
        public string TelefonoContacto { get; set; }
        public string CorreoElectronico { get; set; }
        public string Contrasena { get; set; }
    }
}
