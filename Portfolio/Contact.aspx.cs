using System;
using System.Web.UI;

namespace Portfolio
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtName.Text) &&
                    !string.IsNullOrEmpty(txtEmail.Text) &&
                    !string.IsNullOrEmpty(txtMessage.Text))
                {
                    // Here you would typically save to database or send email
                    // For demo purposes, just show success message

                    lblMessage.Text = "Thank you! Your message has been sent successfully.";
                    lblMessage.CssClass = "form-message success";
                    lblMessage.Visible = true;

                    // Clear form
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtSubject.Text = "";
                    txtMessage.Text = "";
                }
                else
                {
                    lblMessage.Text = "Please fill in all required fields.";
                    lblMessage.CssClass = "form-message error";
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred. Please try again later.";
                lblMessage.CssClass = "form-message error";
                lblMessage.Visible = true;
            }
        }
    }
}