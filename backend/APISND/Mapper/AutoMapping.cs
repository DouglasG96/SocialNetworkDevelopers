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
            CreateMap<UpdatePublicationDTO,Publicacione>()
                .ForAllMembers(x => x.Condition(
                    (src, dest, prop) =>
                    {
                        // ignore null & empty string properties
                        if (prop == null) return false;
                        if (prop.GetType() == typeof(string) && string.IsNullOrEmpty((string)prop)) return false;

                        return true;
                    }
                ));
            CreateMap<Publicacione, PublicationDTO>().ReverseMap();
            CreateMap<OrdenesVenta, SaleOrderDTO>().ReverseMap();
            CreateMap <Categoria, CategoriesDTO>().ReverseMap();
            CreateMap<SubCategoria, SubCategoryDTO>().ReverseMap();
            CreateMap<OrdenesCompra, BuyOrderDTO>().ReverseMap();
            CreateMap<Wishlist, WishlistDTO>().ReverseMap();
        }
    }
}
