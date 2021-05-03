using APISND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IAdress
    {
        List<Departamento> GetDepartments();
        List<Municipio> GetMunicipalitys(int idDepartment);
    }
}
