﻿using APISND.Models;
using SNDAPI.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SNDAPI.Interface
{
    public interface ICategories
    {
        List<Categoria> GetCategories();
    }
}
