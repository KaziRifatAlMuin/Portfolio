using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Portfolio.Models;

namespace Portfolio.DAL
{
    public class OnlineJudgeDAL
    {
        private readonly string _connectionString;

        public OnlineJudgeDAL()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["PortfolioConnectionString"].ConnectionString;
        }

        public List<OnlineJudge> GetAllOnlineJudges()
        {
            List<OnlineJudge> judges = new List<OnlineJudge>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT Id, JudgeName, ProfileLink, SolveCount, Display, CreatedDate, ModifiedDate 
                                FROM OnlineJudge 
                                ORDER BY SolveCount DESC";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            judges.Add(new OnlineJudge
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                JudgeName = reader["JudgeName"].ToString(),
                                ProfileLink = reader["ProfileLink"].ToString(),
                                SolveCount = Convert.ToInt32(reader["SolveCount"]),
                                Display = Convert.ToBoolean(reader["Display"]),
                                CreatedDate = Convert.ToDateTime(reader["CreatedDate"]),
                                ModifiedDate = reader["ModifiedDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["ModifiedDate"])
                            });
                        }
                    }
                }
            }

            return judges;
        }

        public List<OnlineJudge> GetDisplayedOnlineJudges()
        {
            List<OnlineJudge> judges = new List<OnlineJudge>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT Id, JudgeName, ProfileLink, SolveCount, Display, CreatedDate, ModifiedDate 
                                FROM OnlineJudge 
                                WHERE Display = 1 
                                ORDER BY SolveCount DESC";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            judges.Add(new OnlineJudge
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                JudgeName = reader["JudgeName"].ToString(),
                                ProfileLink = reader["ProfileLink"].ToString(),
                                SolveCount = Convert.ToInt32(reader["SolveCount"]),
                                Display = Convert.ToBoolean(reader["Display"]),
                                CreatedDate = Convert.ToDateTime(reader["CreatedDate"]),
                                ModifiedDate = reader["ModifiedDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["ModifiedDate"])
                            });
                        }
                    }
                }
            }

            return judges;
        }

        public OnlineJudge GetOnlineJudgeById(int id)
        {
            OnlineJudge judge = null;

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = @"SELECT Id, JudgeName, ProfileLink, SolveCount, Display, CreatedDate, ModifiedDate 
                                FROM OnlineJudge 
                                WHERE Id = @Id";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", id);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            judge = new OnlineJudge
                            {
                                Id = Convert.ToInt32(reader["Id"]),
                                JudgeName = reader["JudgeName"].ToString(),
                                ProfileLink = reader["ProfileLink"].ToString(),
                                SolveCount = Convert.ToInt32(reader["SolveCount"]),
                                Display = Convert.ToBoolean(reader["Display"]),
                                CreatedDate = Convert.ToDateTime(reader["CreatedDate"]),
                                ModifiedDate = reader["ModifiedDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["ModifiedDate"])
                            };
                        }
                    }
                }
            }

            return judge;
        }

        public bool InsertOnlineJudge(OnlineJudge judge)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    string query = @"INSERT INTO OnlineJudge (JudgeName, ProfileLink, SolveCount, Display, CreatedDate) 
                                    VALUES (@JudgeName, @ProfileLink, @SolveCount, @Display, @CreatedDate)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@JudgeName", judge.JudgeName);
                        command.Parameters.AddWithValue("@ProfileLink", judge.ProfileLink);
                        command.Parameters.AddWithValue("@SolveCount", judge.SolveCount);
                        command.Parameters.AddWithValue("@Display", judge.Display);
                        command.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                        connection.Open();
                        int result = command.ExecuteNonQuery();
                        return result > 0;
                    }
                }
            }
            catch
            {
                return false;
            }
        }

        public bool UpdateOnlineJudge(OnlineJudge judge)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    string query = @"UPDATE OnlineJudge 
                                    SET JudgeName = @JudgeName, 
                                        ProfileLink = @ProfileLink, 
                                        SolveCount = @SolveCount, 
                                        Display = @Display, 
                                        ModifiedDate = @ModifiedDate 
                                    WHERE Id = @Id";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Id", judge.Id);
                        command.Parameters.AddWithValue("@JudgeName", judge.JudgeName);
                        command.Parameters.AddWithValue("@ProfileLink", judge.ProfileLink);
                        command.Parameters.AddWithValue("@SolveCount", judge.SolveCount);
                        command.Parameters.AddWithValue("@Display", judge.Display);
                        command.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);

                        connection.Open();
                        int result = command.ExecuteNonQuery();
                        return result > 0;
                    }
                }
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteOnlineJudge(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    string query = "DELETE FROM OnlineJudge WHERE Id = @Id";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Id", id);
                        connection.Open();
                        int result = command.ExecuteNonQuery();
                        return result > 0;
                    }
                }
            }
            catch
            {
                return false;
            }
        }
    }
}