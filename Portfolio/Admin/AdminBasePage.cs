using System;
using System.Web.UI;
using Portfolio.Helpers;

namespace Portfolio.Admin
{
    public class AdminBasePage : Page
    {
        protected override void OnLoad(EventArgs e)
        {
            // Check authentication before loading any admin page
            AdminAuth.RequireAuth();
            base.OnLoad(e);
        }

        protected void ShowMessage(string message, string type = "info")
        {
            // This can be overridden in derived pages
            // or implement a common message display mechanism
        }
    }
}