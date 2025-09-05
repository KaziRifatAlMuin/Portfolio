using System;
using System.Collections.Generic;

namespace Portfolio
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var data = new List<ProjectItem>
                {
                    new ProjectItem { Title = "Portfolio Website", Description = "This site, built with ASP.NET Web Forms.", Link = "https://example.com" },
                    new ProjectItem { Title = "Todo App", Description = "Simple task tracker demo.", Link = "https://example.com/todo" },
                };
                rptProjects.DataSource = data;
                rptProjects.DataBind();
            }
        }
    }
}
