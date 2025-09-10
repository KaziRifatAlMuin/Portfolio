using System;
using System.Web.UI;

namespace Portfolio.Admin
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if already logged in
                if (Session["IsAdminLoggedIn"] != null && (bool)Session["IsAdminLoggedIn"])
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string username = txtUsername.Text.Trim();
                    string password = txtPassword.Text.Trim();

                    // Simple authentication
                    if (username.Equals("admin", StringComparison.OrdinalIgnoreCase) && password == "admin123")
                    {
                        // Set session variables
                        Session["IsAdminLoggedIn"] = true;
                        Session["AdminUsername"] = username;
                        Session.Timeout = 30; // 30 minutes timeout

                        // Show success message
                        ShowMessage("Login successful! Redirecting to dashboard...", "success");

                        // Add a small delay and redirect
                        Response.AddHeader("REFRESH", "2;URL=Dashboard.aspx");
                    }
                    else
                    {
                        ShowMessage("Invalid username or password. Please try again.", "error");
                        ClearForm();
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("An error occurred during login: " + ex.Message, "error");
                }
            }
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = type == "success" ? "success-message" : "error-message";
            lblMessage.Visible = true;
        }

        private void ClearForm()
        {
            txtPassword.Text = "";
            txtUsername.Focus();
        }
    }
}