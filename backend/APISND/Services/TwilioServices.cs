using APISND.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace APISND.Services
{
    public class TwilioServices : ITwilio
    {
        private readonly string _accountSid = "ACcedeee9dbd2d2a12959337b3404742a9";
        private readonly string _authToken = "5dee42cc1277c09bbc21d1104eca0e80";
        public async Task<bool> SendSMS(string number, string msg)
        {
            try
            {
                TwilioClient.Init(_accountSid, _authToken);

                var messageOptions = new CreateMessageOptions(
                    new PhoneNumber(string.Format("+503{0}", number)));
                messageOptions.MessagingServiceSid = "MG648440611ba9866d251e08319f4fff70";
                messageOptions.Body = msg;

                var message = await MessageResource.CreateAsync(messageOptions);
                Console.WriteLine(message.Body);

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public bool SendWhatsApp(string number, string msg)
        {
            try
            {
                TwilioClient.Init(_accountSid, _authToken);

                var messageOptions = new CreateMessageOptions(
                    new PhoneNumber(string.Format("whatsapp:+503{0}", number)));
                messageOptions.From = new PhoneNumber("whatsapp:+14155238886");
                messageOptions.Body = msg;

                var message = MessageResource.Create(messageOptions);
                Console.WriteLine(message.Body);

                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
    }
}
