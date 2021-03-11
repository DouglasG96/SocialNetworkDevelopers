using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            ChatIdUsuarioDestinatarioNavigations = new HashSet<Chat>();
            ChatIdUsuarioEmisorNavigations = new HashSet<Chat>();
            ContactoIdUsuarioContactoNavigations = new HashSet<Contacto>();
            ContactoIdUsuarioNavigations = new HashSet<Contacto>();
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

        public virtual Role IdRolNavigation { get; set; }
        public virtual ICollection<Chat> ChatIdUsuarioDestinatarioNavigations { get; set; }
        public virtual ICollection<Chat> ChatIdUsuarioEmisorNavigations { get; set; }
        public virtual ICollection<Contacto> ContactoIdUsuarioContactoNavigations { get; set; }
        public virtual ICollection<Contacto> ContactoIdUsuarioNavigations { get; set; }
        public virtual ICollection<Whislist> Whislists { get; set; }
    }
}
