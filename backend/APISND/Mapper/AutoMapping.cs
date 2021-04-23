using APISND.DTO;
using APISND.Models;
using AutoMapper;
using SNDAPI.DTO;

namespace APISND.Mapper
{
    public class AutoMapping : Profile
    {
        public AutoMapping()
        {
            CreateMap<Usuario, UserDTO>().ReverseMap();
            CreateMap<Publicacione, PublicationDTO>().ReverseMap();
            CreateMap<OrdenesVenta, SaleOrderDTO>().ReverseMap();
            CreateMap <Categoria, CategoriesDTO>().ReverseMap();
        }
    }
}
