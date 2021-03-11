using System;
using System.Collections.Generic;

#nullable disable

namespace APISND.Models
{
    public partial class SubCategoria
    {
        public SubCategoria()
        {
            Publicaciones = new HashSet<Publicacione>();
        }

        public int IdSubCategoria { get; set; }
        public string NombreSubCategoria { get; set; }
        public int? IdCategoria { get; set; }

        public virtual Categoria IdCategoriaNavigation { get; set; }
        public virtual ICollection<Publicacione> Publicaciones { get; set; }
    }
}
