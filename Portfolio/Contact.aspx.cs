using System;
using System.IO;

namespace PortfolioWebForms
{
    public partial class Contact : System.Web.UI.Page
    {
        private object txtName;
        private object txtEmail;
        private object txtMessage;

        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // Starter: save to App_Data/messages.txt
            try
            {
                var name = txtName.Text.Trim();
                var email = txtEmail.Text.Trim();
                var message = txtMessage.Text.Trim();
                string line = string.Format("{0:O}\t{1}\t{2}\t{3}", DateTime.UtcNow,
                                         San(name), San(email), San(message));

                var path = Server.MapPath("~/App_Data/messages.txt");
                Directory.CreateDirectory(Path.GetDirectoryName(path));
                File.AppendAllText(path, line + Environment.NewLine);

                txtName.Text = txtEmail.Text = txtMessage.Text = string.Empty;
                pnlSuccess.Visible = true;
            }
            catch
            {
                pnlSuccess.Visible = false;
                // Keep error generic to avoid leaking server details.
                Page.Validators.Add(new SimpleValidator("Saving failed. Please try again."));
            }
        }

        private static string San(string s) =>
            (s ?? string.Empty).Replace("\t", " ").Replace("\r", " ").Replace("\n", " ").Trim();

        private class SimpleValidator : System.Web.UI.IValidator
        {
            public string ErrorMessage { get; set; }
            public bool IsValid { get; set; } = false;
            public SimpleValidator(string message) { ErrorMessage = message; }
            public void Validate() { }
        }
    }
}
