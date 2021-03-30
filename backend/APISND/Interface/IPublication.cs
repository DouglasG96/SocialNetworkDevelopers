using APISND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IPublication
    {
        List<Publicacione> GetPublications();

    }
}
