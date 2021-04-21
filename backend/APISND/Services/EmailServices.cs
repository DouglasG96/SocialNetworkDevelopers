using APISND.DTO;
using APISND.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace APISND.Services
{
    public class EmailServices : IEmail
    {
        public async Task<bool> SendEmailBuy(EmailDTO emailDTO)
        {
            try
            {

                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential("sndutec@gmail.com", "utec123456"),
                    EnableSsl = true,
                };

                var mailMessage = new MailMessage
                {
                    From = new MailAddress("sndutec@gmail.com", "Cristian Torres"),
                    Subject = string.Format("Nueva Venta atravez de SND {0}", emailDTO.Title),
                    Body = emailDTO.Messages,
                    IsBodyHtml = true,
                };
                mailMessage.To.Add("cristiantorresalfaro91@gmail.com");
                await smtpClient.SendMailAsync(mailMessage);

                return true;
            }
            catch (Exception e)
            {

                throw;
            }
        }
    }
}
