using APISND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface ISubCategory
    {
        List<SubCategoria> GetSubCategoryByCategory(int id);
    }
}
