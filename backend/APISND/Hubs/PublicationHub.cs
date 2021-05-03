using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISND.Hubs
{
    public class PublicationHub : Hub
    {
        public async Task SendMyEvent()
        {
            await Clients.All.SendAsync("MyEvent");
        }
    }
}
