using APISND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IPublication
    {
        Task<List<Publicacione>> GetPublications();
        Task<Publicacione> GetPublicationById(int id);
        Task<Publicacione> AddPublication(Publicacione publication);
        Task<Publicacione> UpdatePublication(Publicacione publication);
        Task<Publicacione> DeletePublication(int id);
        bool PublicationExists(int id);
    }
}
