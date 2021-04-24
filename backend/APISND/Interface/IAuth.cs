
using APISND.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IAuth
    {
        Task<string> Login(AuthDTO user);
    }
}
