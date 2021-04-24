using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Helpers
{
    public class AuthorizeRolesAttribute : AuthorizeAttribute
    {
 

        public AuthorizeRolesAttribute(params int[] roles) : base()
        {
            Roles = string.Join(",", roles);
        }
    }
}
