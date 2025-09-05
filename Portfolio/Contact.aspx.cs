using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Xml.Linq;

namespace PortfolioWebForms
{
    public partial class Contact : Page
    {
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName?.Text.Trim();
            string email = txtEmail?.Text.Trim();
            string message = txtMessage?.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                lblResult.Text = "Please fill out all fields.";
                lblResult.CssClass = "text-danger";
                return;
            }

            try
            {
                var fromAddress = new MailAddress("youremail@gmail.com", "Portfolio Contact");
                var toAddress = new MailAddress("recipientemail@gmail.com", "Your Name");
                const string subject = "Contact Form Message";
                string body = $"Name: {name}\nEmail: {email}\nMessage: {message}";

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    Credentials = new NetworkCredential("youremail@gmail.com", "yourpassword")
                };

                smtp.Send(fromAddress, toAddress, subject, body);

                lblResult.Text = "Message sent successfully!";
                lblResult.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                lblResult.Text = $"Error: {ex.Message}";
                lblResult.CssClass = "text-danger";
            }
        }
    }
}
