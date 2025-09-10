using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portfolio.DAL;
using Portfolio.Models;

namespace Portfolio.Admin
{
    public partial class ViewJudges : Page
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
                LoadJudges();
            }
        }

        private void LoadJudges()
        {
            try
            {
                List<OnlineJudge> judges = judgeDAL.GetAllOnlineJudges();

                if (judges.Count == 0)
                {
                    pnlNoJudges.Visible = true;
                    rptJudges.Visible = false;
                }
                else
                {
                    pnlNoJudges.Visible = false;
                    rptJudges.Visible = true;
                    rptJudges.DataSource = judges;
                    rptJudges.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle error
                pnlNoJudges.Visible = true;
                rptJudges.Visible = false;
            }
        }

        protected void rptJudges_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int judgeId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditJudge")
            {
                Response.Redirect($"OnlineJudgeManagement.aspx?id={judgeId}");
            }
            else if (e.CommandName == "DeleteJudge")
            {
                try
                {
                    bool success = judgeDAL.DeleteOnlineJudge(judgeId);
                    if (success)
                    {
                        LoadJudges(); // Refresh the list
                    }
                }
                catch (Exception ex)
                {
                    // Handle error
                }
            }
        }

        protected string GetJudgeIcon(int index)
        {
            string[] icons = { "fa-code", "fa-terminal", "fa-laptop-code" };
            return icons[index % icons.Length];
        }
    }
}