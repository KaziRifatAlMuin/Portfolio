using System;
using System.Collections.Generic;
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
            // Check if user is logged in
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
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
                    ShowMessage($"Entry '{judge.JudgeName}' loaded for editing.", "success");
                }
                else
                {
                    ShowMessage("Judge entry not found.", "error");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading entry: " + ex.Message, "error");
            }
        }

        private void BindOnlineJudges()
        {
            try
            {
                List<OnlineJudge> judges = judgeDAL.GetAllOnlineJudges();
                gvOnlineJudges.DataSource = judges;
                gvOnlineJudges.DataBind();

                // Update page info
                if (judges.Count > 0)
                {
                    Page.Title = $"Online Judge Management ({judges.Count} entries)";
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading data: " + ex.Message, "error");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    OnlineJudge judge = new OnlineJudge
                    {
                        JudgeName = txtJudgeName.Text.Trim(),
                        ProfileLink = txtProfileLink.Text.Trim(),
                        SolveCount = Convert.ToInt32(txtSolveCount.Text.Trim()),
                        Display = chkDisplay.Checked
                    };

                    bool success;
                    if (hdnJudgeId.Value == "0" || string.IsNullOrEmpty(hdnJudgeId.Value))
                    {
                        // Add new entry
                        success = judgeDAL.InsertOnlineJudge(judge);
                        if (success)
                        {
                            ShowMessage($"✅ Online judge entry '{judge.JudgeName}' added successfully!", "success");
                        }
                        else
                        {
                            ShowMessage("❌ Error adding entry. Please try again.", "error");
                        }
                    }
                    else
                    {
                        // Update existing entry
                        judge.Id = Convert.ToInt32(hdnJudgeId.Value);
                        success = judgeDAL.UpdateOnlineJudge(judge);
                        if (success)
                        {
                            ShowMessage($"✅ Online judge entry '{judge.JudgeName}' updated successfully!", "success");
                        }
                        else
                        {
                            ShowMessage("❌ Error updating entry. Please try again.", "error");
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
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            ShowMessage("🔄 Form cleared. Ready for new entry.", "success");
        }

        protected void gvOnlineJudges_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int judgeId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditJudge")
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
                        ShowMessage($"📝 Entry '{judge.JudgeName}' loaded for editing.", "success");

                        // Scroll to form
                        ScriptManager.RegisterStartupScript(this, GetType(), "ScrollToForm",
                            "document.querySelector('.form-section').scrollIntoView({behavior: 'smooth'});", true);
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("❌ Error loading entry: " + ex.Message, "error");
                }
            }
            else if (e.CommandName == "DeleteJudge")
            {
                try
                {
                    // Get judge name for confirmation message
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
                catch (Exception ex)
                {
                    ShowMessage("❌ Error deleting entry: " + ex.Message, "error");
                }
            }
        }

        protected void gvOnlineJudges_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add hover effect and styling
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='rgba(0, 255, 255, 0.08)'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=''");

                // Add data attributes for potential JavaScript functionality
                if (e.Row.DataItem is OnlineJudge judge)
                {
                    e.Row.Attributes.Add("data-judge-id", judge.Id.ToString());
                    e.Row.Attributes.Add("data-judge-name", judge.JudgeName);
                }
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

            // Clear any validation errors
            Page.Validate();
            if (!Page.IsValid)
            {
                foreach (BaseValidator validator in Page.Validators)
                {
                    validator.IsValid = true;
                }
            }
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message " + type;
            lblMessage.Visible = true;

            // Auto-hide success messages after 5 seconds
            if (type == "success")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "HideMessage",
                    "setTimeout(function() { var msg = document.querySelector('.message.success'); if(msg) msg.style.display = 'none'; }, 5000);", true);
            }
        }
    }
}