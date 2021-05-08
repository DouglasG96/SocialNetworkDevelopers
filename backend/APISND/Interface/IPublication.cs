using APISND.DTO;
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
        Task<PublicationDTO> GetPublicationById(int id);
        Task<List<PublicationDTO>> GetPublicationByIdUser(int idUser);
        Task<Publicacione> AddPublication(Publicacione publication);
        Task<Publicacione> UpdatePublication(UpdatePublicationDTO publication);
        Task<Publicacione> DeletePublication(int id);
        bool PublicationExists(int id);
    }
}
