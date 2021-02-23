using System;
using System.Collections.Generic;

#nullable disable

namespace SNDAPI.Models
{
    public partial class Categoria
    {
        public Categoria()
        {
            SubCategoria = new HashSet<SubCategoria>();
        }

        public int IdCategoria { get; set; }
        public string NombreCategoria { get; set; }

        public virtual ICollection<SubCategoria> SubCategoria { get; set; }
    }
}
