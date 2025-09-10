using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Portfolio
{
    public partial class Projects : Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjectsData();
            }
        }

        private void LoadProjectsData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string query = @"SELECT Title, ImageURL, GitHubURL, Description, Tags, CreatedDate 
                                    FROM Projects 
                                    ORDER BY CreatedDate DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptProjects.DataSource = dt;
                    rptProjects.DataBind();
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadProjectsData error: " + ex.Message);
            }
        }

        protected string GetTagsHtml(string tags)
        {
            if (string.IsNullOrEmpty(tags))
                return "";

            string[] tagArray = tags.Split(',');
            string html = "";

            foreach (string tag in tagArray)
            {
                html += $"<span class=\"tech-tag\">{tag.Trim()}</span>";
            }

            return html;
        }

        protected string GetProjectImage(object imageUrl)
        {
            string defaultLogo = "images/default-project-logo.png"; // Default logo path

            if (imageUrl == null || imageUrl == DBNull.Value)
            {
                return defaultLogo;
            }

            string imagePath = imageUrl.ToString().Trim();

            if (string.IsNullOrEmpty(imagePath))
            {
                return defaultLogo;
            }

            // Check if image file exists on server
            string physicalPath = Server.MapPath("~/images/" + imagePath);

            if (File.Exists(physicalPath))
            {
                return "images/" + imagePath;
            }
            else
            {
                return defaultLogo;
            }
        }

        protected string GetProjectIcon(string title)
        {
            // Dynamic icon based on project title/type
            string titleLower = title.ToLower();

            if (titleLower.Contains("campus") || titleLower.Contains("bazar") || titleLower.Contains("shop"))
                return "fas fa-shopping-cart";
            else if (titleLower.Contains("numerical") || titleLower.Contains("calculator") || titleLower.Contains("math"))
                return "fas fa-calculator";
            else if (titleLower.Contains("portfolio") || titleLower.Contains("website"))
                return "fas fa-globe";
            else if (titleLower.Contains("management") || titleLower.Contains("system"))
                return "fas fa-cogs";
            else if (titleLower.Contains("weather"))
                return "fas fa-cloud-sun";
            else if (titleLower.Contains("library"))
                return "fas fa-book";
            else if (titleLower.Contains("task"))
                return "fas fa-tasks";
            else
                return "fas fa-code"; // Default icon
        }
    }
}