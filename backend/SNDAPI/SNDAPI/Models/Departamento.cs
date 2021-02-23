using System;
using System.Collections.Generic;

#nullable disable

namespace SNDAPI.Models
{
    public partial class Departamento
    {
        public Departamento()
        {
            Municipios = new HashSet<Municipio>();
        }

        public int IdDepartamento { get; set; }
        public string Departamento1 { get; set; }

        public virtual ICollection<Municipio> Municipios { get; set; }
    }
}
