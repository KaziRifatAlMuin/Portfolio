using System;
using System.Web;
using System.Web.UI;

namespace Portfolio.Admin
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if already logged in via session or cookie
                if (IsAdminLoggedIn())
                {
                    Response.Redirect("Dashboard.aspx");
                    return;
                }

                // Check for remember me cookie
                CheckRememberMeCookie();
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
                        Session["LoginTime"] = DateTime.Now;
                        Session.Timeout = 60; // 60 minutes timeout

                        // Set persistent cookie for 7 days
                        HttpCookie authCookie = new HttpCookie("AdminAuth", "true");
                        authCookie.Expires = DateTime.Now.AddDays(7);
                        authCookie.HttpOnly = true;
                        authCookie.Secure = Request.IsSecureConnection;
                        Response.Cookies.Add(authCookie);

                        HttpCookie userCookie = new HttpCookie("AdminUser", username);
                        userCookie.Expires = DateTime.Now.AddDays(7);
                        userCookie.HttpOnly = true;
                        userCookie.Secure = Request.IsSecureConnection;
                        Response.Cookies.Add(userCookie);

                        // Show success message and redirect
                        ShowMessage("✅ Login successful! Redirecting to dashboard...", "success");

                        // Redirect after short delay
                        Response.AddHeader("REFRESH", "2;URL=Dashboard.aspx");
                    }
                    else
                    {
                        ShowMessage("❌ Invalid username or password. Please try again.", "error");
                        ClearForm();
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("❌ An error occurred during login. Please try again.", "error");
                    System.Diagnostics.Debug.WriteLine("Login error: " + ex.Message);
                }
            }
        }

        private bool IsAdminLoggedIn()
        {
            try
            {
                // Check session first
                if (Session["IsAdminLoggedIn"] != null && (bool)Session["IsAdminLoggedIn"])
                {
                    return true;
                }

                // Check cookie if session is not set
                HttpCookie authCookie = Request.Cookies["AdminAuth"];
                if (authCookie != null && authCookie.Value == "true")
                {
                    // Restore session from cookie
                    HttpCookie userCookie = Request.Cookies["AdminUser"];
                    if (userCookie != null)
                    {
                        Session["IsAdminLoggedIn"] = true;
                        Session["AdminUsername"] = userCookie.Value;
                        Session["LoginTime"] = DateTime.Now;
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("IsAdminLoggedIn error: " + ex.Message);
            }

            return false;
        }

        private void CheckRememberMeCookie()
        {
            try
            {
                HttpCookie authCookie = Request.Cookies["AdminAuth"];
                HttpCookie userCookie = Request.Cookies["AdminUser"];

                if (authCookie != null && authCookie.Value == "true" && userCookie != null)
                {
                    txtUsername.Text = userCookie.Value;
                    // Don't auto-fill password for security reasons
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("CheckRememberMeCookie error: " + ex.Message);
            }
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message " + (type == "success" ? "success-message" : "error-message");
            lblMessage.Visible = true;
        }

        private void ClearForm()
        {
            txtPassword.Text = "";
            txtUsername.Focus();
        }
    }
}