using APISND.DTO;
using APISND.Models;
using AutoMapper;

namespace APISND.Mapper
{
    public class AutoMapping : Profile
    {
        public AutoMapping()
        {
            CreateMap<Usuario, UserDTO>().ReverseMap();
        }
    }
}
