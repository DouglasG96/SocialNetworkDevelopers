using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class Municipio
    {
        public Municipio()
        {
            Publicaciones = new HashSet<Publicacione>();
            Usuarios = new HashSet<Usuario>();
        }

        public int IdMunicipio { get; set; }
        public string Municipio1 { get; set; }
        public int? IdDepartamento { get; set; }

        public virtual Departamento IdDepartamentoNavigation { get; set; }
        public virtual ICollection<Publicacione> Publicaciones { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
