using System;
using System.Web;
using System.Web.UI;

namespace Portfolio.Admin
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (!IsAdminLoggedIn())
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private bool IsAdminLoggedIn()
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

            return false;
        }

        private void LoadDashboardData()
        {
            try
            {
                // Load admin name
                if (Session["AdminUsername"] != null)
                {
                    lblAdminName.Text = Session["AdminUsername"].ToString();
                }
                else
                {
                    lblAdminName.Text = "Admin";
                }
            }
            catch (Exception ex)
            {
                // Handle error gracefully
                lblAdminName.Text = "Admin";
                System.Diagnostics.Debug.WriteLine("Dashboard load error: " + ex.Message);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                // Clear session
                Session["IsAdminLoggedIn"] = null;
                Session["AdminUsername"] = null;
                Session["LoginTime"] = null;
                Session.Clear();

                // Clear cookies
                HttpCookie authCookie = new HttpCookie("AdminAuth", "");
                authCookie.Expires = DateTime.Now.AddDays(-1);
                authCookie.HttpOnly = true;
                Response.Cookies.Add(authCookie);

                HttpCookie userCookie = new HttpCookie("AdminUser", "");
                userCookie.Expires = DateTime.Now.AddDays(-1);
                userCookie.HttpOnly = true;
                Response.Cookies.Add(userCookie);

                // Redirect to login page
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Logout error: " + ex.Message);
                Response.Redirect("Login.aspx");
            }
        }
    }
}