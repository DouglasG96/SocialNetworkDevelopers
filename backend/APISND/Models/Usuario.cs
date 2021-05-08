using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            OrdenesCompras = new HashSet<OrdenesCompra>();
            Publicaciones = new HashSet<Publicacione>();
            Ratings = new HashSet<Rating>();
            Whislists = new HashSet<Whislist>();
        }

        public int IdUsuario { get; set; }
        public int? IdRol { get; set; }
        public string NombreCompleto { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Dui { get; set; }
        public string Nit { get; set; }
        public string TelefonoContacto { get; set; }
        public string CorreoElectronico { get; set; }
        public string Contrasena { get; set; }
        public int? IdDepartamento { get; set; }
        public int? IdMunicipio { get; set; }
        public string Direccion { get; set; }
        public string Vendedor { get; set; }
        public string Comprador { get; set; }
        public int? EstadoUsuario { get; set; }
        public string Contribuyente { get; set; }

        public virtual Departamento IdDepartamentoNavigation { get; set; }
        public virtual Municipio IdMunicipioNavigation { get; set; }
        public virtual Role IdRolNavigation { get; set; }
        public virtual ICollection<OrdenesCompra> OrdenesCompras { get; set; }
        public virtual ICollection<Publicacione> Publicaciones { get; set; }
        public virtual ICollection<Rating> Ratings { get; set; }
        public virtual ICollection<Whislist> Whislists { get; set; }
    }
}
