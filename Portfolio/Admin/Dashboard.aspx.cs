using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio.Admin
{
    public partial class Dashboard : Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsAdminLoggedIn())
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadAdminName();
                LoadCurrentTable();
            }
        }

        private bool IsAdminLoggedIn()
        {
            if (Session["IsAdminLoggedIn"] is bool isAdmin && isAdmin) return true;

            var authCookie = Request.Cookies["AdminAuth"];
            if (authCookie?.Value == "true")
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

        private void LoadAdminName()
        {
            if (Session["AdminUsername"] != null)
                lblAdminName.Text = Session["AdminUsername"].ToString();
        }

        private void LoadCurrentTable()
        {
            string table = ddlTableSelector.SelectedValue;
            ConfigureFormForTable(table);
            BindCurrentTable(table);
        }

        private void ConfigureFormForTable(string table)
        {
            ClearAllFormControls();
            ConfigureFormFields(table);
            ConfigureGridColumns(table);
            UpdateTitles(table);
        }

        private void UpdateTitles(string table)
        {
            switch (table)
            {
                case "OnlineJudge": lblFormTitle.Text = "📝 Add Online Judge"; break;
                case "Projects": lblFormTitle.Text = "📝 Add Project"; break;
                case "Skills": lblFormTitle.Text = "📝 Add Skill"; break;
                case "ICPCHistory": lblFormTitle.Text = "📝 Add ICPC Entry"; break;
                case "IUPCHistory": lblFormTitle.Text = "📝 Add IUPC Entry"; break;
            }
        }

        private void ConfigureFormFields(string table)
        {
            switch (table)
            {
                case "OnlineJudge":
                    pnlName.Visible = pnlSolveCount.Visible = pnlProfileURL.Visible = pnlImageURL.Visible = pnlDisplayText.Visible = true;
                    break;
                case "Projects":
                    pnlName.Visible = pnlImageURL.Visible = pnlGitHubURL.Visible = pnlDescription.Visible = pnlTags.Visible = true;
                    break;
                case "Skills":
                    pnlName.Visible = pnlSkillType.Visible = pnlPercentage.Visible = true;
                    ddlSkillType.Items.Clear();
                    ddlSkillType.Items.Add(new ListItem("Select Type...", ""));
                    ddlSkillType.Items.Add(new ListItem("Programming Languages", "Programming Languages"));
                    ddlSkillType.Items.Add(new ListItem("Tools and Technologies", "Tools and Technologies"));
                    ddlSkillType.Items.Add(new ListItem("Competitive Programming", "Competitive Programming"));
                    break;
                case "ICPCHistory":
                case "IUPCHistory":
                    pnlContestTitle.Visible = pnlContestDate.Visible = pnlRank.Visible = pnlStatus.Visible = pnlContestURL.Visible = true;
                    break;
            }
        }

        private void ConfigureGridColumns(string table)
        {
            gvRecords.Columns.Clear();
            gvRecords.DataKeyNames = new[] { "Id" };

            // Add bound fields first
            switch (table)
            {
                case "OnlineJudge":
                    gvRecords.Columns.Add(new BoundField { DataField = "Name", HeaderText = "Name" });
                    gvRecords.Columns.Add(new BoundField { DataField = "SolveCount", HeaderText = "Solve Count" });
                    gvRecords.Columns.Add(new BoundField { DataField = "ProfileURL", HeaderText = "Profile URL" });
                    gvRecords.Columns.Add(new BoundField { DataField = "ImageURL", HeaderText = "Image URL" });
                    gvRecords.Columns.Add(new BoundField { DataField = "DisplayText", HeaderText = "Display Text" });
                    break;
                case "Projects":
                    gvRecords.Columns.Add(new BoundField { DataField = "Title", HeaderText = "Title" });
                    gvRecords.Columns.Add(new BoundField { DataField = "ImageURL", HeaderText = "Image URL" });
                    gvRecords.Columns.Add(new BoundField { DataField = "GitHubURL", HeaderText = "GitHub URL" });
                    gvRecords.Columns.Add(new BoundField { DataField = "Description", HeaderText = "Description" });
                    gvRecords.Columns.Add(new BoundField { DataField = "Tags", HeaderText = "Tags" });
                    break;
                case "Skills":
                    gvRecords.Columns.Add(new BoundField { DataField = "Name", HeaderText = "Name" });
                    gvRecords.Columns.Add(new BoundField { DataField = "Type", HeaderText = "Type" });
                    gvRecords.Columns.Add(new BoundField { DataField = "Percentage", HeaderText = "Percentage" });
                    break;
                case "ICPCHistory":
                case "IUPCHistory":
                    gvRecords.Columns.Add(new BoundField { DataField = "ContestTitle", HeaderText = "Contest Title" });
                    gvRecords.Columns.Add(new BoundField { DataField = "ContestDate", HeaderText = "Date", DataFormatString = "{0:yyyy-MM-dd}" });
                    gvRecords.Columns.Add(new BoundField { DataField = "Rank", HeaderText = "Rank" });
                    gvRecords.Columns.Add(new BoundField { DataField = "Status", HeaderText = "Status" });
                    gvRecords.Columns.Add(new BoundField { DataField = "ContestURL", HeaderText = "Contest URL" });
                    break;
            }

            // Add CommandField - Simple and standard approach
            var commandField = new CommandField();
            commandField.ShowEditButton = true;
            commandField.ShowDeleteButton = true;
            commandField.ShowCancelButton = true;
            commandField.HeaderText = "Actions";
            gvRecords.Columns.Add(commandField);
        }

        private void BindCurrentTable(string table)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    string query = GetSelectQuery(table);
                    if (string.IsNullOrEmpty(query)) return;

                    var da = new SqlDataAdapter(query, con);
                    var dt = new DataTable();
                    da.Fill(dt);

                    pnlNoRecords.Visible = dt.Rows.Count == 0;
                    gvRecords.Visible = dt.Rows.Count > 0;
                    gvRecords.DataSource = dt;
                    gvRecords.DataBind();

                    System.Diagnostics.Debug.WriteLine($"Loaded {dt.Rows.Count} records from {table}");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading data: " + ex.Message, "error");
                System.Diagnostics.Debug.WriteLine($"BindCurrentTable error: {ex.Message}");
            }
        }

        private string GetSelectQuery(string table)
        {
            switch (table)
            {
                case "OnlineJudge": return "SELECT * FROM OnlineJudge ORDER BY SolveCount DESC";
                case "Projects": return "SELECT * FROM Projects ORDER BY CreatedDate DESC";
                case "Skills": return "SELECT * FROM Skills ORDER BY Type, Percentage DESC";
                case "ICPCHistory": return "SELECT * FROM ICPCHistory ORDER BY ContestDate DESC";
                case "IUPCHistory": return "SELECT * FROM IUPCHistory ORDER BY ContestDate DESC";
                default: return "";
            }
        }

        protected void ddlTableSelector_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCurrentTable();
            ShowMessage("Switched to " + ddlTableSelector.SelectedItem.Text, "success");
        }

        // ================== GRIDVIEW EVENTS ==================
        protected void gvRecords_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRecords.EditIndex = e.NewEditIndex;
            BindCurrentTable(ddlTableSelector.SelectedValue);
        }

        protected void gvRecords_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRecords.EditIndex = -1;
            BindCurrentTable(ddlTableSelector.SelectedValue);
        }

        protected void gvRecords_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(gvRecords.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvRecords.Rows[e.RowIndex];
                string table = ddlTableSelector.SelectedValue;

                System.Diagnostics.Debug.WriteLine($"Updating record: Table={table}, Id={id}");

                bool success = UpdateRecord(table, id, row);
                if (success)
                {
                    ShowMessage("Record updated successfully", "success");
                    gvRecords.EditIndex = -1;
                    BindCurrentTable(table);
                }
                else
                {
                    ShowMessage("Failed to update record", "error");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "error");
                System.Diagnostics.Debug.WriteLine($"gvRecords_RowUpdating error: {ex.Message}");
            }
        }

        protected void gvRecords_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine($"=== DELETE EVENT TRIGGERED ===");

                int id = Convert.ToInt32(gvRecords.DataKeys[e.RowIndex].Value);
                string table = ddlTableSelector.SelectedValue;

                System.Diagnostics.Debug.WriteLine($"Deleting: Table={table}, Id={id}");

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    SqlCommand cmd = new SqlCommand($"DELETE FROM {table} WHERE Id=@Id", con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    System.Diagnostics.Debug.WriteLine($"Rows affected: {rowsAffected}");

                    if (rowsAffected > 0)
                    {
                        ShowMessage($"Record deleted successfully from {table}", "success");
                        BindCurrentTable(table);
                        System.Diagnostics.Debug.WriteLine($"Delete successful");
                    }
                    else
                    {
                        ShowMessage("No records were deleted", "error");
                        System.Diagnostics.Debug.WriteLine($"No rows affected");
                    }
                }

                System.Diagnostics.Debug.WriteLine($"=== DELETE EVENT COMPLETED ===");
            }
            catch (Exception ex)
            {
                ShowMessage("Error during delete: " + ex.Message, "error");
                System.Diagnostics.Debug.WriteLine($"Delete error: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Stack trace: {ex.StackTrace}");
            }
        }

        protected void gvRecords_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add delete confirmation to the delete button
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[e.Row.Cells.Count - 1].Controls[2]).OnClientClick = "return confirm('Are you sure you want to delete this record?');";
                }
            }
        }

        private bool UpdateRecord(string table, int id, GridViewRow row)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = con;

                    switch (table)
                    {
                        case "OnlineJudge":
                            cmd.CommandText = "UPDATE OnlineJudge SET Name=@Name, SolveCount=@SolveCount, ProfileURL=@ProfileURL, ImageURL=@ImageURL, DisplayText=@DisplayText, ModifiedDate=@ModifiedDate WHERE Id=@Id";
                            cmd.Parameters.AddWithValue("@Name", ((TextBox)row.Cells[0].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@SolveCount", Convert.ToInt32(((TextBox)row.Cells[1].Controls[0]).Text));
                            cmd.Parameters.AddWithValue("@ProfileURL", ((TextBox)row.Cells[2].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@ImageURL", ((TextBox)row.Cells[3].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@DisplayText", ((TextBox)row.Cells[4].Controls[0]).Text);
                            break;

                        case "Projects":
                            cmd.CommandText = "UPDATE Projects SET Title=@Title, ImageURL=@ImageURL, GitHubURL=@GitHubURL, Description=@Description, Tags=@Tags, ModifiedDate=@ModifiedDate WHERE Id=@Id";
                            cmd.Parameters.AddWithValue("@Title", ((TextBox)row.Cells[0].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@ImageURL", ((TextBox)row.Cells[1].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@GitHubURL", ((TextBox)row.Cells[2].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@Description", ((TextBox)row.Cells[3].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@Tags", ((TextBox)row.Cells[4].Controls[0]).Text);
                            break;

                        case "Skills":
                            cmd.CommandText = "UPDATE Skills SET Name=@Name, Type=@Type, Percentage=@Percentage, ModifiedDate=@ModifiedDate WHERE Id=@Id";
                            cmd.Parameters.AddWithValue("@Name", ((TextBox)row.Cells[0].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@Type", ((TextBox)row.Cells[1].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@Percentage", Convert.ToInt32(((TextBox)row.Cells[2].Controls[0]).Text));
                            break;

                        case "ICPCHistory":
                        case "IUPCHistory":
                            cmd.CommandText = $"UPDATE {table} SET ContestTitle=@ContestTitle, ContestDate=@ContestDate, Rank=@Rank, Status=@Status, ContestURL=@ContestURL, ModifiedDate=@ModifiedDate WHERE Id=@Id";
                            cmd.Parameters.AddWithValue("@ContestTitle", ((TextBox)row.Cells[0].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@ContestDate", Convert.ToDateTime(((TextBox)row.Cells[1].Controls[0]).Text));
                            cmd.Parameters.AddWithValue("@Rank", Convert.ToInt32(((TextBox)row.Cells[2].Controls[0]).Text));
                            cmd.Parameters.AddWithValue("@Status", ((TextBox)row.Cells[3].Controls[0]).Text);
                            cmd.Parameters.AddWithValue("@ContestURL", ((TextBox)row.Cells[4].Controls[0]).Text);
                            break;

                        default:
                            return false;
                    }

                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    System.Diagnostics.Debug.WriteLine($"Update executed: {rowsAffected} rows affected");
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Update error: " + ex.Message);
                return false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string table = ddlTableSelector.SelectedValue;
            try
            {
                bool ok = InsertRecord(table);
                if (ok)
                {
                    ShowMessage("Record added successfully", "success");
                    ClearFormTextValues();  // Clear form after successful save
                    BindCurrentTable(table);
                    UpdateTitles(table);
                }
                else
                {
                    ShowMessage("Failed to add record", "error");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "error");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();

            if (Request.Cookies["AdminAuth"] != null)
            {
                var cookie = new HttpCookie("AdminAuth", "") { Expires = DateTime.Now.AddDays(-1) };
                Response.Cookies.Add(cookie);
            }
            if (Request.Cookies["AdminUser"] != null)
            {
                var cookie = new HttpCookie("AdminUser", "") { Expires = DateTime.Now.AddDays(-1) };
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("Login.aspx");
        }

        private bool InsertRecord(string table)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    switch (table)
                    {
                        case "OnlineJudge":
                            cmd.CommandText = "INSERT INTO OnlineJudge (Name, SolveCount, ProfileURL, ImageURL, DisplayText, CreatedDate) VALUES (@Name,@SolveCount,@ProfileURL,@ImageURL,@DisplayText,@CreatedDate)";
                            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                            cmd.Parameters.AddWithValue("@SolveCount", Convert.ToInt32(txtSolveCount.Text.Trim()));
                            cmd.Parameters.AddWithValue("@ProfileURL", txtProfileURL.Text.Trim());
                            cmd.Parameters.AddWithValue("@ImageURL", txtImageURL.Text.Trim());
                            cmd.Parameters.AddWithValue("@DisplayText", txtDisplayText.Text.Trim());
                            break;
                        case "Projects":
                            cmd.CommandText = "INSERT INTO Projects (Title, ImageURL, GitHubURL, Description, Tags, CreatedDate) VALUES (@Title,@ImageURL,@GitHubURL,@Description,@Tags,@CreatedDate)";
                            cmd.Parameters.AddWithValue("@Title", txtName.Text.Trim());
                            cmd.Parameters.AddWithValue("@ImageURL", txtImageURL.Text.Trim());
                            cmd.Parameters.AddWithValue("@GitHubURL", txtGitHubURL.Text.Trim());
                            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                            cmd.Parameters.AddWithValue("@Tags", txtTags.Text.Trim());
                            break;
                        case "Skills":
                            cmd.CommandText = "INSERT INTO Skills (Name, Type, Percentage, CreatedDate) VALUES (@Name,@Type,@Percentage,@CreatedDate)";
                            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                            cmd.Parameters.AddWithValue("@Type", ddlSkillType.SelectedValue);
                            cmd.Parameters.AddWithValue("@Percentage", Convert.ToInt32(txtPercentage.Text.Trim()));
                            break;
                        case "ICPCHistory":
                        case "IUPCHistory":
                            cmd.CommandText = $"INSERT INTO {table} (ContestTitle, ContestDate, Rank, Status, ContestURL, CreatedDate) VALUES (@ContestTitle,@ContestDate,@Rank,@Status,@ContestURL,@CreatedDate)";
                            cmd.Parameters.AddWithValue("@ContestTitle", txtContestTitle.Text.Trim());
                            cmd.Parameters.AddWithValue("@ContestDate", Convert.ToDateTime(txtContestDate.Text));
                            cmd.Parameters.AddWithValue("@Rank", Convert.ToInt32(txtRank.Text.Trim()));
                            cmd.Parameters.AddWithValue("@Status", txtStatus.Text.Trim());
                            cmd.Parameters.AddWithValue("@ContestURL", txtContestURL.Text.Trim());
                            break;
                        default: return false;
                    }

                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    System.Diagnostics.Debug.WriteLine($"Insert executed: {rowsAffected} rows affected");
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Insert error: " + ex.Message);
                return false;
            }
        }

        // Method to clear only text values without hiding panels (used after successful save)
        private void ClearFormTextValues()
        {
            txtName.Text = string.Empty;
            txtSolveCount.Text = string.Empty;
            txtProfileURL.Text = string.Empty;
            txtImageURL.Text = string.Empty;
            txtGitHubURL.Text = string.Empty;
            txtDisplayText.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtTags.Text = string.Empty;
            txtPercentage.Text = string.Empty;
            txtContestTitle.Text = string.Empty;
            txtContestDate.Text = string.Empty;
            txtRank.Text = string.Empty;
            txtStatus.Text = string.Empty;
            txtContestURL.Text = string.Empty;

            // Reset dropdown to first option (if Skills is selected)
            if (ddlSkillType.Items.Count > 0)
            {
                ddlSkillType.SelectedIndex = 0;
            }

            // Reset hidden field
            hdnRecordId.Value = "0";

            // Reset button text
            btnSave.Text = "💾 Save Entry";
        }

        // Method used when switching tables - hides panels and clears values
        private void ClearAllFormControls()
        {
            pnlName.Visible = pnlSolveCount.Visible = pnlProfileURL.Visible = pnlImageURL.Visible = pnlGitHubURL.Visible =
            pnlDisplayText.Visible = pnlDescription.Visible = pnlTags.Visible = pnlSkillType.Visible = pnlPercentage.Visible =
            pnlContestTitle.Visible = pnlContestDate.Visible = pnlRank.Visible = pnlStatus.Visible = pnlContestURL.Visible = false;

            txtName.Text = txtSolveCount.Text = txtProfileURL.Text = txtImageURL.Text = txtGitHubURL.Text = txtDisplayText.Text =
            txtDescription.Text = txtTags.Text = txtPercentage.Text = txtContestTitle.Text = txtContestDate.Text = txtRank.Text =
            txtStatus.Text = txtContestURL.Text = string.Empty;

            btnSave.Text = "💾 Save Entry";
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message " + type;
            lblMessage.Visible = true;
        }
    }
}