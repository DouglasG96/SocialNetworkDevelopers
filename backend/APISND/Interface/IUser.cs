using APISND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IUser
    {
        List<Usuario> GetUsers();
        Task<Usuario> GetUserByID(int id);
        Task<Usuario> AddUser(Usuario user);
        Task<Usuario> UpdateUser(Usuario user);
        Task<Usuario> DeleteUser(int id);
        bool UserExists(int id);
        Task<bool> UserExistsEmail(string email);

    }
}
