using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;

namespace Portfolio
{
    public partial class Skills : Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllSkillsData();
                LoadOnlineJudgesDataWithCounting();
                LoadICPCHistoryData();
                LoadIUPCHistoryData();
            }
        }

        private void LoadAllSkillsData()
        {
            try
            {
                LoadProgrammingLanguages();
                LoadCompetitiveProgramming();
                LoadToolsTechnologies();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadAllSkillsData error: " + ex.Message);
            }
        }

        private void LoadProgrammingLanguages()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string query = @"SELECT Name, Percentage FROM Skills 
                                    WHERE Type = 'Programming Languages' 
                                    ORDER BY Percentage DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    UpdateSkillSection("languages", dt);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadProgrammingLanguages error: " + ex.Message);
            }
        }

        private void LoadCompetitiveProgramming()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string query = @"SELECT Name, Percentage FROM Skills 
                                    WHERE Type = 'Competitive Programming' 
                                    ORDER BY Percentage DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    UpdateSkillSection("competitive", dt);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadCompetitiveProgramming error: " + ex.Message);
            }
        }

        private void LoadToolsTechnologies()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string query = @"SELECT Name, Percentage FROM Skills 
                                    WHERE Type = 'Tools and Technologies' 
                                    ORDER BY Percentage DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    UpdateSkillSection("tools", dt);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadToolsTechnologies error: " + ex.Message);
            }
        }

        private void UpdateSkillSection(string category, DataTable dt)
        {
            StringBuilder skillsHtml = new StringBuilder();

            foreach (DataRow row in dt.Rows)
            {
                string skillName = row["Name"].ToString();
                int percentage = Convert.ToInt32(row["Percentage"]);

                skillsHtml.Append($@"
                    <div class='skill-item' role='listitem'>
                        <span class='skill-name'>{skillName}</span>
                        <div class='skill-bar' role='progressbar' aria-valuenow='{percentage}' aria-valuemin='0' aria-valuemax='100'>
                            <div class='skill-progress' data-width='{percentage}%' aria-label='{skillName} proficiency: {percentage}%'></div>
                        </div>
                    </div>");
            }

            string script = $@"
                document.addEventListener('DOMContentLoaded', function() {{
                    var categoryElement = document.querySelector('[data-category=""{category}""] .skill-list');
                    if (categoryElement) {{
                        categoryElement.innerHTML = `{skillsHtml.ToString().Replace("'", "\\'")}`;
                        
                        setTimeout(function() {{
                            var skillBars = categoryElement.querySelectorAll('.skill-progress');
                            skillBars.forEach(function(bar, index) {{
                                setTimeout(function() {{
                                    var width = bar.getAttribute('data-width');
                                    bar.style.width = width;
                                }}, index * 200);
                            }});
                        }}, 500);
                    }}
                }});";

            ClientScript.RegisterStartupScript(this.GetType(), $"UpdateSkills_{category}", script, true);
        }

        private void LoadOnlineJudgesDataWithCounting()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string query = @"SELECT Name, SolveCount, ProfileURL, ImageURL, DisplayText 
                                    FROM OnlineJudge 
                                    ORDER BY SolveCount DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count == 0)
                    {
                        pnlNoJudges.Visible = true;
                        GenerateEmptyJudgeGrid();
                    }
                    else
                    {
                        pnlNoJudges.Visible = false;
                        GenerateJudgeCardsWithCounting(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadOnlineJudgesDataWithCounting error: " + ex.Message);
                pnlNoJudges.Visible = true;
                GenerateEmptyJudgeGrid();
            }
        }

        private void GenerateJudgeCardsWithCounting(DataTable dt)
        {
            StringBuilder judgeHtml = new StringBuilder();

            foreach (DataRow row in dt.Rows)
            {
                string name = row["Name"].ToString();
                string solveCount = row["SolveCount"].ToString();
                string profileURL = row["ProfileURL"].ToString();
                string imageURL = row["ImageURL"].ToString();
                string displayText = row["DisplayText"].ToString();

                // Get dynamic icon based on judge name for fallback
                string iconClass = GetJudgeIcon(name);

                judgeHtml.Append($@"
                    <article class='judge-card' role='listitem'>
                        {GetJudgeImageHtml(imageURL, name, iconClass)}
                        <div class='judge-header'>
                            <a href='{profileURL}' target='_blank' rel='noopener noreferrer' class='judge-name' aria-label='View {name} profile'>{name}</a>
                        </div>
                        <div class='judge-stats'>
                            <div class='problem-count' data-count='{solveCount}' aria-label='{solveCount} problems solved'>0</div>
                            <div class='problem-label'>Problems Solved</div>
                            <div class='judge-rating'>{displayText}</div>
                        </div>
                    </article>");
            }

            string script = $@"
                document.addEventListener('DOMContentLoaded', function() {{
                    var judgeGrid = document.getElementById('judgeGrid');
                    if (judgeGrid) {{
                        judgeGrid.innerHTML = `{judgeHtml.ToString().Replace("'", "\\'")}`;
                        judgeGrid.setAttribute('role', 'list');
                        judgeGrid.setAttribute('aria-label', 'Online judge profiles');
                        
                        setTimeout(function() {{
                            if (typeof initializeCounters === 'function') {{
                                initializeCounters();
                            }}
                        }}, 500);
                    }}
                }});";

            ClientScript.RegisterStartupScript(this.GetType(), "LoadJudgeCardsWithCounting", script, true);
        }

        private string GetJudgeImageHtml(string imageURL, string judgeName, string iconClass)
        {
            if (!string.IsNullOrEmpty(imageURL))
            {
                return $@"
                    <div class='judge-image'>
                        <img src='images/{imageURL}' alt='{judgeName}' class='judge-img' loading='lazy' />
                    </div>";
            }
            else
            {
                return $@"
                    <div class='judge-icon'>
                        <i class='{iconClass}' aria-hidden='true'></i>
                    </div>";
            }
        }

        private string GetJudgeIcon(string judgeName)
        {
            string name = judgeName.ToLower();

            if (name.Contains("codeforces"))
                return "fas fa-fire";
            else if (name.Contains("atcoder"))
                return "fas fa-atom";
            else if (name.Contains("codechef"))
                return "fas fa-utensils";
            else if (name.Contains("leetcode"))
                return "fas fa-brain";
            else if (name.Contains("hackerrank"))
                return "fas fa-terminal";
            else if (name.Contains("spoj"))
                return "fas fa-trophy";
            else if (name.Contains("uva") || name.Contains("onlinejudge"))
                return "fas fa-graduation-cap";
            else
                return "fas fa-code";
        }

        private void GenerateEmptyJudgeGrid()
        {
            string script = @"
                document.addEventListener('DOMContentLoaded', function() {
                    var judgeGrid = document.getElementById('judgeGrid');
                    if (judgeGrid) {
                        judgeGrid.innerHTML = '';
                        judgeGrid.style.display = 'none';
                    }
                });";

            ClientScript.RegisterStartupScript(this.GetType(), "EmptyJudgeGrid", script, true);
        }

        private void LoadICPCHistoryData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string query = @"SELECT ContestTitle, ContestDate, Rank, Status, ContestURL 
                                    FROM ICPCHistory 
                                    ORDER BY ContestDate DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        UpdateContestTable("icpc", dt);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadICPCHistoryData error: " + ex.Message);
            }
        }

        private void LoadIUPCHistoryData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string query = @"SELECT ContestTitle, ContestDate, Rank, Status, ContestURL 
                                    FROM IUPCHistory 
                                    ORDER BY ContestDate DESC";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        UpdateContestTable("iupc", dt);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("LoadIUPCHistoryData error: " + ex.Message);
            }
        }

        private void UpdateContestTable(string contestType, DataTable dt)
        {
            StringBuilder tableRows = new StringBuilder();

            foreach (DataRow row in dt.Rows)
            {
                string contestTitle = row["ContestTitle"].ToString();
                DateTime contestDate = Convert.ToDateTime(row["ContestDate"]);
                int rank = Convert.ToInt32(row["Rank"]);
                string status = row["Status"].ToString();
                string contestURL = row["ContestURL"].ToString();

                string rankClass = GetRankClass(rank);
                string statusClass = GetStatusClass(status);
                string urlLink = string.IsNullOrEmpty(contestURL) ? "#" : contestURL;

                tableRows.Append($@"
                    <tr class='contest-row' data-rank='{rank}' role='row'>
                        <td>
                            <a href='{urlLink}' target='_blank' rel='noopener noreferrer' class='contest-link' aria-label='{contestTitle} details'>
                                {contestTitle}
                            </a>
                        </td>
                        <td>{contestDate:MMMM dd, yyyy}</td>
                        <td class='rank-cell'>
                            <span class='rank-badge {rankClass}' aria-label='Rank: {rank}{GetOrdinalSuffix(rank)} place'>{rank}{GetOrdinalSuffix(rank)}</span>
                        </td>
                        <td>
                            <span class='status-badge {statusClass}' aria-label='Status: {status}'>{status}</span>
                        </td>
                    </tr>");
            }

            string tableId = contestType == "icpc" ? "icpc-history-title" : "iupc-history-title";

            string script = $@"
                document.addEventListener('DOMContentLoaded', function() {{
                    var section = document.querySelector('[aria-labelledby=""{tableId}""]');
                    if (section) {{
                        var tbody = section.querySelector('.contest-table tbody');
                        if (tbody) {{
                            tbody.innerHTML = `{tableRows.ToString().Replace("'", "\\'")}`;
                        }}
                    }}
                }});";

            ClientScript.RegisterStartupScript(this.GetType(), $"UpdateContestTable_{contestType}", script, true);
        }

        private string GetRankClass(int rank)
        {
            if (rank <= 30) return "rank-excellent";
            if (rank <= 50) return "rank-good";
            return "rank-average";
        }

        private string GetStatusClass(string status)
        {
            string statusLower = status.ToLower();
            if (statusLower.Contains("winner") || statusLower.Contains("top performer")) return "status-winner";
            if (statusLower.Contains("qualified") || statusLower.Contains("regional")) return "status-qualified";
            return "status-participated";
        }

        private string GetOrdinalSuffix(int number)
        {
            if (number % 100 >= 11 && number % 100 <= 13) return "th";

            switch (number % 10)
            {
                case 1: return "st";
                case 2: return "nd";
                case 3: return "rd";
                default: return "th";
            }
        }
    }
}