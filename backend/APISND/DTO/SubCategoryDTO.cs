using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class SubCategoryDTO
    {
        public int IdSubCategoria { get; set; }
        public string NombreSubCategoria { get; set; }
        public int? IdCategoria { get; set; }
    }
}
