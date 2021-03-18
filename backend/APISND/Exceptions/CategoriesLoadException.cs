using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SNDAPI.Exceptions
{
    public class CategoriesLoadException : Exception
    {
        public CategoriesLoadException(string message) : base(message)
        {
        }
    }
}
