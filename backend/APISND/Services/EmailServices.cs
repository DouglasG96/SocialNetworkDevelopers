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

                //mensaje vendedor
                var mailMessageSeller = new MailMessage
                {
                    From = new MailAddress("sndutec@gmail.com", "Cristian Torres"),
                    Subject =  emailDTO.Title,
                    Body = emailDTO.MessagesSeller,
                    IsBodyHtml = true,
                };
                mailMessageSeller.To.Add(emailDTO.EmailSeller);
                await smtpClient.SendMailAsync(mailMessageSeller);

                //mensaje comprador
                var mailMessageBuyer = new MailMessage
                {
                    From = new MailAddress("sndutec@gmail.com", "Cristian Torres"),
                    Subject = emailDTO.Title,
                    Body = emailDTO.MessagesBuyer,
                    IsBodyHtml = true,
                };
                mailMessageBuyer.To.Add(emailDTO.EmailBuyer);
                await smtpClient.SendMailAsync(mailMessageBuyer);

                return true;
            }
            catch (Exception e)
            {

                throw;
            }
        }
    }
}
