﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.DTO
{
    public class ReceivedBuyerDTO
    {
        public int IdSaleOrder { get; set; }
        public int IdBuyOrder { get; set; }
        public int Raiting { get; set; }
    }
}