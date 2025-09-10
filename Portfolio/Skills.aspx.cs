using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portfolio.DAL;
using Portfolio.Models;
using System.Web.Script.Serialization;

namespace Portfolio
{
    public partial class Skills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOnlineJudgeData();
            }
        }

        private void LoadOnlineJudgeData()
        {
            try
            {
                OnlineJudgeDAL judgeDAL = new OnlineJudgeDAL();
                List<OnlineJudge> judges = judgeDAL.GetDisplayedOnlineJudges();

                if (judges.Count > 0)
                {
                    pnlNoJudges.Visible = false;

                    // Create JSON data for client-side rendering
                    var judgeData = judges.Select(j => new {
                        judgeName = j.JudgeName,
                        profileLink = j.ProfileLink,
                        solveCount = j.SolveCount
                    }).ToArray();

                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    string judgeJson = serializer.Serialize(judgeData);

                    // Register startup script to populate judge data
                    string script = $@"
                        window.onlineJudgeData = {judgeJson};
                        console.log('Online judge data loaded:', window.onlineJudgeData);
                    ";

                    ClientScript.RegisterStartupScript(this.GetType(), "judgeData", script, true);
                }
                else
                {
                    pnlNoJudges.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Log error and show no judges message
                pnlNoJudges.Visible = true;
                System.Diagnostics.Debug.WriteLine("Error loading online judge data: " + ex.Message);
            }
        }
    }
}