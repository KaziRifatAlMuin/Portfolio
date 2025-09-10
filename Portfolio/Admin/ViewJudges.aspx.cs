using System;
using System.Collections.Generic;
using System.Web;
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
            if (!IsAdminLoggedIn())
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadJudges();
            }
        }

        private bool IsAdminLoggedIn()
        {
            if (Session["IsAdminLoggedIn"] != null && (bool)Session["IsAdminLoggedIn"])
            {
                return true;
            }

            var authCookie = Request.Cookies["AdminAuth"];
            if (authCookie != null && authCookie.Value == "true")
            {
                var userCookie = Request.Cookies["AdminUser"];
                if (userCookie != null)
                {
                    Session["IsAdminLoggedIn"] = true;
                    Session["AdminUsername"] = userCookie.Value;
                    return true;
                }
            }

            return false;
        }

        private void LoadJudges()
        {
            try
            {
                List<OnlineJudge> judges = judgeDAL.GetAllOnlineJudges();

                if (judges.Count == 0)
                {
                    pnlNoJudges.Visible = true;
                    gvJudges.Visible = false;
                }
                else
                {
                    pnlNoJudges.Visible = false;
                    gvJudges.Visible = true;
                    gvJudges.DataSource = judges;
                    gvJudges.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("❌ Error loading judges: " + ex.Message, "error");
                pnlNoJudges.Visible = true;
                gvJudges.Visible = false;
                System.Diagnostics.Debug.WriteLine("LoadJudges error: " + ex.Message);
            }
        }

        protected void gvJudges_RowCommand(object source, GridViewCommandEventArgs e)
        {
            try
            {
                int judgeId = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "EditJudge")
                {
                    Response.Redirect($"OnlineJudgeManagement.aspx?id={judgeId}");
                }
                else if (e.CommandName == "DeleteJudge")
                {
                    OnlineJudge judge = judgeDAL.GetOnlineJudgeById(judgeId);
                    string judgeName = judge?.JudgeName ?? "Unknown";

                    bool success = judgeDAL.DeleteOnlineJudge(judgeId);
                    if (success)
                    {
                        ShowMessage($"✅ Judge '{judgeName}' deleted successfully!", "success");
                        LoadJudges();
                    }
                    else
                    {
                        ShowMessage("❌ Error deleting entry. Please try again.", "error");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("❌ Error: " + ex.Message, "error");
                System.Diagnostics.Debug.WriteLine("gvJudges_RowCommand error: " + ex.Message);
            }
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message " + type;
            lblMessage.Visible = true;
        }
    }
}