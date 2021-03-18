using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Requests
{
    public class CategoriesRequest
    {
        public CategoriesRequest()
        {
            //SubCategoria = new HashSet<SubCategoria>();
        }

        public int IdCategoria { get; set; }
        public string NombreCategoria { get; set; }
        public int? EstadoCategoria { get; set; }

        /*
        public virtual ICollection<SubCategoria> SubCategoria { get; set; }
        */
    }
}
