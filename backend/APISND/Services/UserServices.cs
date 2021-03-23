using APISND.DTO;
using APISND.Interface;
using APISND.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Services
{
    public class UserServices : IUser
    {
        private readonly SocialNetworkDeveloperContext _context;
        private readonly IMapper _mapper;

        public UserServices(SocialNetworkDeveloperContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public  List<UserDTO> GetUsers()
        {
            return _mapper.ProjectTo<UserDTO>(_context.Usuarios).ToList();
        }

    }
}
