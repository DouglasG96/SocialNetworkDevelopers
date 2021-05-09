using APISND.Models;
using APISND.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IStatistics
    {
        List<StatisticsDTO> GetStatistics();
    }
}
