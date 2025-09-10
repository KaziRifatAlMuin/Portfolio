using System;
using System.Web;

namespace Portfolio.Helpers
{
    public static class AdminAuth
    {
        private const string ADMIN_SESSION_KEY = "IsAdminLoggedIn";
        private const string ADMIN_USERNAME_KEY = "AdminUsername";

        public static bool IsLoggedIn
        {
            get
            {
                return HttpContext.Current.Session[ADMIN_SESSION_KEY] != null && 
                       (bool)HttpContext.Current.Session[ADMIN_SESSION_KEY];
            }
        }

        public static string Username
        {
            get
            {
                return HttpContext.Current.Session[ADMIN_USERNAME_KEY]?.ToString() ?? "Admin";
            }
        }

        public static void Login(string username)
        {
            HttpContext.Current.Session[ADMIN_SESSION_KEY] = true;
            HttpContext.Current.Session[ADMIN_USERNAME_KEY] = username;
        }

        public static void Logout()
        {
            HttpContext.Current.Session[ADMIN_SESSION_KEY] = null;
            HttpContext.Current.Session[ADMIN_USERNAME_KEY] = null;
            HttpContext.Current.Session.Clear();
        }

        public static void RequireAuth()
        {
            if (!IsLoggedIn)
            {
                HttpContext.Current.Response.Redirect("~/Admin/Login.aspx");
            }
        }
    }
}