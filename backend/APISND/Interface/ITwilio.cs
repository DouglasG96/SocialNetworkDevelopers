using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Interface
{
    public interface ITwilio
    {
        Task<bool> SendSMS(string number, string msg);
        bool SendWhatsApp(string number, string msg);

    }
}
