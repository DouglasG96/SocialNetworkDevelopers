using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SNDAPI.DTO
{
    public class CategoriesDTO
    {
        public int IdCategoria { get; set; }
        public string NombreCategoria { get; set; }
        public int? EstadoCategoria { get; set; }
    }
}
