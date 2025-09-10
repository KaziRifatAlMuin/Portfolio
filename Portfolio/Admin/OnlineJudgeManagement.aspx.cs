using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portfolio.DAL;
using Portfolio.Models;

namespace Portfolio.Admin
{
    public partial class OnlineJudgeManagement : Page
    {
        private OnlineJudgeDAL judgeDAL = new OnlineJudgeDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check authentication
            if (!IsAdminLoggedIn())
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Check if editing existing judge
                if (Request.QueryString["id"] != null)
                {
                    int judgeId;
                    if (int.TryParse(Request.QueryString["id"], out judgeId))
                    {
                        LoadJudgeForEdit(judgeId);
                    }
                }

                BindOnlineJudges();
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

        private void LoadJudgeForEdit(int judgeId)
        {
            try
            {
                OnlineJudge judge = judgeDAL.GetOnlineJudgeById(judgeId);
                if (judge != null)
                {
                    hdnJudgeId.Value = judge.Id.ToString();
                    txtJudgeName.Text = judge.JudgeName;
                    txtProfileLink.Text = judge.ProfileLink;
                    txtSolveCount.Text = judge.SolveCount.ToString();
                    chkDisplay.Checked = judge.Display;
                    btnSave.Text = "💾 Update Entry";
                    ShowMessage($"✏️ Entry '{judge.JudgeName}' loaded for editing.", "success");
                }
                else
                {
                    ShowMessage("❌ Judge entry not found.", "error");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("❌ Error loading entry: " + ex.Message, "error");
                System.Diagnostics.Debug.WriteLine("LoadJudgeForEdit error: " + ex.Message);
            }
        }

        private void BindOnlineJudges()
        {
            try
            {
                List<OnlineJudge> judges = judgeDAL.GetAllOnlineJudges();
                gvOnlineJudges.DataSource = judges;
                gvOnlineJudges.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("❌ Error loading data: " + ex.Message, "error");
                System.Diagnostics.Debug.WriteLine("BindOnlineJudges error: " + ex.Message);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Create judge object from form data
                    OnlineJudge judge = new OnlineJudge
                    {
                        JudgeName = txtJudgeName.Text.Trim(),
                        ProfileLink = txtProfileLink.Text.Trim(),
                        SolveCount = Convert.ToInt32(txtSolveCount.Text.Trim()),
                        Display = chkDisplay.Checked
                    };

                    bool success;
                    string judgeId = hdnJudgeId.Value;

                    if (string.IsNullOrEmpty(judgeId) || judgeId == "0")
                    {
                        // Add new entry
                        judge.CreatedDate = DateTime.Now;
                        success = judgeDAL.InsertOnlineJudge(judge);
                        if (success)
                        {
                            ShowMessage($"✅ Judge '{judge.JudgeName}' added successfully!", "success");
                        }
                        else
                        {
                            ShowMessage("❌ Error adding entry. Please check your database connection.", "error");
                        }
                    }
                    else
                    {
                        // Update existing entry
                        judge.Id = Convert.ToInt32(judgeId);
                        judge.ModifiedDate = DateTime.Now;
                        success = judgeDAL.UpdateOnlineJudge(judge);
                        if (success)
                        {
                            ShowMessage($"✅ Judge '{judge.JudgeName}' updated successfully!", "success");
                        }
                        else
                        {
                            ShowMessage("❌ Error updating entry. Please check your database connection.", "error");
                        }
                    }

                    if (success)
                    {
                        ClearForm();
                        BindOnlineJudges();
                    }
                }
                catch (FormatException)
                {
                    ShowMessage("❌ Please enter a valid number for solve count.", "error");
                }
                catch (Exception ex)
                {
                    ShowMessage("❌ Error: " + ex.Message, "error");
                    System.Diagnostics.Debug.WriteLine("btnSave_Click error: " + ex.Message);
                }
            }
            else
            {
                ShowMessage("❌ Please fill in all required fields correctly.", "error");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            ShowMessage("🔄 Form cleared. Ready for new entry.", "success");
        }

        protected void gvOnlineJudges_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int judgeId = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "EditJudge")
                {
                    OnlineJudge judge = judgeDAL.GetOnlineJudgeById(judgeId);
                    if (judge != null)
                    {
                        hdnJudgeId.Value = judge.Id.ToString();
                        txtJudgeName.Text = judge.JudgeName;
                        txtProfileLink.Text = judge.ProfileLink;
                        txtSolveCount.Text = judge.SolveCount.ToString();
                        chkDisplay.Checked = judge.Display;
                        btnSave.Text = "💾 Update Entry";
                        ShowMessage($"📝 Entry '{judge.JudgeName}' loaded for editing.", "success");

                        // Scroll to form
                        ClientScript.RegisterStartupScript(this.GetType(), "ScrollToForm",
                            "document.querySelector('.form-section').scrollIntoView({behavior: 'smooth'});", true);
                    }
                    else
                    {
                        ShowMessage("❌ Judge entry not found.", "error");
                    }
                }
                else if (e.CommandName == "DeleteJudge")
                {
                    OnlineJudge judge = judgeDAL.GetOnlineJudgeById(judgeId);
                    string judgeName = judge?.JudgeName ?? "Unknown";

                    bool success = judgeDAL.DeleteOnlineJudge(judgeId);
                    if (success)
                    {
                        ShowMessage($"🗑️ Entry '{judgeName}' deleted successfully!", "success");
                        BindOnlineJudges();

                        // Clear form if editing deleted item
                        if (hdnJudgeId.Value == judgeId.ToString())
                        {
                            ClearForm();
                        }
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
                System.Diagnostics.Debug.WriteLine("gvOnlineJudges_RowCommand error: " + ex.Message);
            }
        }

        private void ClearForm()
        {
            hdnJudgeId.Value = "0";
            txtJudgeName.Text = "";
            txtProfileLink.Text = "";
            txtSolveCount.Text = "";
            chkDisplay.Checked = true;
            btnSave.Text = "💾 Save Entry";
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message " + type;
            lblMessage.Visible = true;

            if (type == "success")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "HideMessage",
                    "setTimeout(function() { var msg = document.querySelector('.message.success'); if(msg) msg.style.display = 'none'; }, 4000);", true);
            }
        }
    }
}