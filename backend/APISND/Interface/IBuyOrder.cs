using APISND.DTO;
using APISND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface IBuyOrder
    {
        List<BuyOrderDTO> GetHistoryBuysByIdBuyer(int id);
    }
}
