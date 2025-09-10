<%@ Page Title="View Judges" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewJudges.aspx.cs" Inherits="Portfolio.Admin.ViewJudges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/admin.css" />
    <style>
        .view-container {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 1rem;
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

        .back-btn {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: linear-gradient(135deg, #666, #999);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            font-weight: 500;
        }

        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 102, 102, 0.4);
        }

        .judges-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .judge-card {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.8), rgba(14, 15, 43, 0.9));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        .judge-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.05), rgba(64, 224, 208, 0.08));
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .judge-card:hover::before {
            opacity: 1;
        }

        .judge-card:hover {
            transform: translateY(-8px) scale(1.02);
            border-color: rgba(0, 255, 255, 0.3);
            box-shadow: 0 15px 40px rgba(0, 255, 255, 0.15);
        }

        .judge-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
        }

        .judge-logo {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.2), rgba(64, 224, 208, 0.3));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid rgba(0, 255, 255, 0.3);
        }

        .judge-logo i {
            font-size: 1.5rem;
            color: #00ffff;
            text-shadow: 0 0 15px rgba(0, 255, 255, 0.5);
        }

        .judge-info h3 {
            color: #ffffff;
            margin: 0;
            font-size: 1.3rem;
        }

        .judge-info .profile-link {
            color: #00ffff;
            text-decoration: none;
            font-size: 0.9rem;
            word-break: break-all;
        }

        .judge-stats {
            position: relative;
            z-index: 1;
            margin-bottom: 1.5rem;
        }

        .solve-count {
            font-size: 2.5rem;
            font-weight: 700;
            color: #00ffff;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
            display: block;
            text-align: center;
            margin-bottom: 0.5rem;
        }

        .solve-label {
            text-align: center;
            color: #b8c5d6;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .status-badge {
            display: inline-block;
            padding: 0.4rem 0.8rem;
            border-radius: 10px;
            font-size: 0.8rem;
            font-weight: 500;
            text-align: center;
            width: 100%;
            box-sizing: border-box;
        }

        .status-active {
            background: linear-gradient(135deg, rgba(0, 255, 0, 0.2), rgba(50, 205, 50, 0.3));
            color: #00ff00;
            border: 1px solid rgba(0, 255, 0, 0.4);
        }

        .status-inactive {
            background: linear-gradient(135deg, rgba(255, 0, 0, 0.2), rgba(255, 68, 68, 0.3));
            color: #ff4444;
            border: 1px solid rgba(255, 0, 0, 0.4);
        }

        .judge-actions {
            display: flex;
            gap: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .btn {
            flex: 1;
            padding: 0.6rem;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            font-size: 0.9rem;
        }

        .btn-edit {
            background: linear-gradient(135deg, #40e0d0, #00ffff);
            color: #000;
        }

        .btn-delete {
            background: linear-gradient(135deg, #ff4444, #cc0000);
            color: #fff;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .no-judges {
            text-align: center;
            padding: 4rem 2rem;
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.8), rgba(14, 15, 43, 0.9));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            color: #b8c5d6;
        }

        .no-judges h3 {
            color: #00ffff;
            margin-bottom: 1rem;
        }

        .add-judge-btn {
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #000;
            border: none;
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin-top: 1rem;
        }

        .add-judge-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 255, 255, 0.4);
        }

        @media (max-width: 768px) {
            .judges-grid {
                grid-template-columns: 1fr;
            }
            
            .back-btn {
                position: static;
                margin-bottom: 1rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="view-container">
        <div class="view-header">
            <a href="Dashboard.aspx" class="back-btn">
                <i class="fas fa-arrow-left"></i> Dashboard
            </a>
            <h1>View All Judges</h1>
            <p style="color: #b8c5d6;">Manage all your competitive programming platform entries</p>
        </div>

        <asp:Panel ID="pnlNoJudges" runat="server" CssClass="no-judges" Visible="false">
            <h3>No Judges Found</h3>
            <p>You haven't added any online judge entries yet. Start by adding your first competitive programming platform.</p>
            <a href="OnlineJudgeManagement.aspx" class="add-judge-btn">
                <i class="fas fa-plus"></i> Add Your First Judge
            </a>
        </asp:Panel>

        <div class="judges-grid">
            <asp:Repeater ID="rptJudges" runat="server" OnItemCommand="rptJudges_ItemCommand">
                <ItemTemplate>
                    <div class="judge-card">
                        <div class="judge-header">
                            <div class="judge-logo">
                                <i class="fas <%# GetJudgeIcon(Container.ItemIndex) %>"></i>
                            </div>
                            <div class="judge-info">
                                <h3><%# Eval("JudgeName") %></h3>
                                <a href='<%# Eval("ProfileLink") %>' target="_blank" class="profile-link">View Profile</a>
                            </div>
                        </div>
                        
                        <div class="judge-stats">
                            <span class="solve-count"><%# String.Format("{0:N0}", Eval("SolveCount")) %></span>
                            <div class="solve-label">Problems Solved</div>
                            <div class="status-badge <%# Convert.ToBoolean(Eval("Display")) ? "status-active" : "status-inactive" %>">
                                <%# Convert.ToBoolean(Eval("Display")) ? "Active - Displayed on Skills Page" : "Inactive - Hidden from Skills Page" %>
                            </div>
                        </div>

                        <div class="judge-actions">
                            <asp:LinkButton ID="btnEdit" runat="server" 
                                CommandName="EditJudge" 
                                CommandArgument='<%# Eval("Id") %>' 
                                CssClass="btn btn-edit">
                                <i class="fas fa-edit"></i> Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server" 
                                CommandName="DeleteJudge" 
                                CommandArgument='<%# Eval("Id") %>' 
                                CssClass="btn btn-delete"
                                OnClientClick="return confirm('Are you sure you want to delete this judge entry?');">
                                <i class="fas fa-trash"></i> Delete
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>