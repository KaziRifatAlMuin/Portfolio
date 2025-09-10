using System;
using System.Web.UI;
using Portfolio.DAL;

namespace Portfolio.Admin
{
    public partial class Dashboard : Page
    {
        private OnlineJudgeDAL judgeDAL = new OnlineJudgeDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
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

                // Load statistics
                var allJudges = judgeDAL.GetAllOnlineJudges();
                var activeJudges = judgeDAL.GetDisplayedOnlineJudges();

                lblTotalJudges.Text = allJudges.Count.ToString();
                lblActiveJudges.Text = activeJudges.Count.ToString();

                int totalSolves = 0;
                foreach (var judge in allJudges)
                {
                    totalSolves += judge.SolveCount;
                }
                lblTotalSolves.Text = totalSolves.ToString("N0");
            }
            catch (Exception ex)
            {
                // Handle error gracefully
                lblTotalJudges.Text = "Error";
                lblActiveJudges.Text = "Error";
                lblTotalSolves.Text = "Error";
            }
        }
    }
}