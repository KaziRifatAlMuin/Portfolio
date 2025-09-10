<%@ Page Title="View Judges" Language="C#" AutoEventWireup="true" CodeBehind="ViewJudges.aspx.cs" Inherits="Portfolio.Admin.ViewJudges" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>View Judges - Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, rgba(14, 15, 43, 0.95) 0%, rgba(16, 7, 43, 0.9) 100%);
            min-height: 100vh;
            padding: 1rem;
        }

        .view-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .view-header {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.9), rgba(14, 15, 43, 1));
            border: 1px solid rgba(0, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
        }

        .view-header h1 {
            color: #00ffff;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
        }

        .back-portfolio-btn {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: linear-gradient(135deg, #666, #999);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .back-portfolio-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 102, 102, 0.4);
            color: #fff;
        }

        .add-btn {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #000;
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 255, 255, 0.4);
            color: #000;
        }

        .table-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.8), rgba(14, 15, 43, 0.9));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            overflow: hidden;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
        }

        .data-table th {
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.15), rgba(64, 224, 208, 0.2));
            color: #00ffff;
            padding: 1rem;
            text-align: left;
            font-weight: 700;
            border-bottom: 2px solid rgba(0, 255, 255, 0.3);
        }

        .data-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(0, 255, 255, 0.1);
            color: #e1e5f2;
        }

        .data-table tr:hover {
            background: rgba(0, 255, 255, 0.08);
        }

        .table-link {
            color: #00ffff;
            text-decoration: none;
            font-weight: 500;
        }

        .table-link:hover {
            color: #40e0d0;
        }

        .status-active {
            color: #00ff88;
            font-weight: 600;
        }

        .status-inactive {
            color: #ff6b6b;
            font-weight: 600;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin: 0 0.25rem;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background: linear-gradient(135deg, #40e0d0, #00ffff);
            color: #000;
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 255, 255, 0.4);
        }

        .btn-delete {
            background: linear-gradient(135deg, #ff4444, #cc0000);
            color: #fff;
        }

        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 68, 68, 0.4);
        }

        .no-judges {
            text-align: center;
            padding: 4rem 2rem;
            color: #b8c5d6;
        }

        .no-judges h3 {
            color: #00ffff;
            margin-bottom: 1rem;
        }

        .message {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 500;
        }

        .message.success {
            background: rgba(0, 255, 0, 0.1);
            border: 1px solid rgba(0, 255, 0, 0.3);
            color: #00ff00;
        }

        .message.error {
            background: rgba(255, 0, 0, 0.1);
            border: 1px solid rgba(255, 0, 0, 0.3);
            color: #ff4444;
        }

        @media (max-width: 768px) {
            .back-portfolio-btn, .add-btn {
                position: static;
                margin: 0.5rem;
            }
            
            .data-table {
                font-size: 0.8rem;
            }
            
            .data-table th,
            .data-table td {
                padding: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="view-container">
            <div class="view-header">
                <a href="../Home.aspx" class="back-portfolio-btn">
                    <i class="fas fa-arrow-left"></i> Back to Portfolio
                </a>
                <a href="OnlineJudgeManagement.aspx" class="add-btn">
                    <i class="fas fa-plus"></i> Add Judge
                </a>
                <h1>📋 All Judges</h1>
                <p style="color: #b8c5d6;">Manage your competitive programming entries</p>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

            <div class="table-section">
                <asp:Panel ID="pnlNoJudges" runat="server" CssClass="no-judges" Visible="false">
                    <h3>📝 No Judges Found</h3>
                    <p>You haven't added any online judge entries yet.</p>
                    <a href="OnlineJudgeManagement.aspx" class="btn btn-edit">
                        <i class="fas fa-plus"></i> Add Your First Judge
                    </a>
                </asp:Panel>

                <asp:GridView ID="gvJudges" runat="server" AutoGenerateColumns="false" CssClass="data-table"
                    OnRowCommand="gvJudges_RowCommand" EmptyDataText="No judges found.">
                    <Columns>
                        <asp:BoundField DataField="JudgeName" HeaderText="🏆 Judge Name" />
                        <asp:BoundField DataField="SolveCount" HeaderText="🔢 Solve Count" DataFormatString="{0:N0}" />
                        <asp:TemplateField HeaderText="🔗 Profile">
                            <ItemTemplate>
                                <a href='<%# Eval("ProfileLink") %>' target="_blank" class="table-link">
                                    <i class="fas fa-external-link-alt"></i> View
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="👁️ Status">
                            <ItemTemplate>
                                <span class='<%# Convert.ToBoolean(Eval("Display")) ? "status-active" : "status-inactive" %>'>
                                    <%# Convert.ToBoolean(Eval("Display")) ? "✅ Active" : "❌ Hidden" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreatedDate" HeaderText="📅 Created" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:TemplateField HeaderText="⚡ Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" Text="✏️ Edit" CommandName="EditJudge" 
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-edit" />
                                <asp:LinkButton ID="btnDelete" runat="server" Text="🗑️ Delete" CommandName="DeleteJudge" 
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-delete"
                                    OnClientClick='return confirm("Are you sure you want to delete this entry?\n\nJudge: <%# Eval("JudgeName") %>\nSolve Count: <%# Eval("SolveCount") %>\n\nThis action cannot be undone!");' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>