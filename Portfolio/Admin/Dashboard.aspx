<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Portfolio.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/admin.css" />
    <style>
        .dashboard-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .dashboard-header {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.9), rgba(14, 15, 43, 1));
            border: 1px solid rgba(0, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
        }

        .dashboard-header h1 {
            color: #00ffff;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
        }

        .welcome-text {
            color: #b8c5d6;
            font-size: 1.1rem;
            margin-bottom: 1rem;
        }

        .logout-btn {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: linear-gradient(135deg, #ff4444, #cc0000);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            font-weight: 500;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 68, 68, 0.4);
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .dashboard-card {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.8), rgba(14, 15, 43, 0.9));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        .dashboard-card::before {
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

        .dashboard-card:hover::before {
            opacity: 1;
        }

        .dashboard-card:hover {
            transform: translateY(-8px) scale(1.02);
            border-color: rgba(0, 255, 255, 0.3);
            box-shadow: 0 15px 40px rgba(0, 255, 255, 0.15);
        }

        .card-icon {
            font-size: 3rem;
            color: #00ffff;
            margin-bottom: 1rem;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
            position: relative;
            z-index: 1;
        }

        .card-title {
            color: #ffffff;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            position: relative;
            z-index: 1;
        }

        .card-description {
            color: #b8c5d6;
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
        }

        .card-button {
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
            position: relative;
            z-index: 1;
        }

        .card-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 255, 255, 0.4);
        }

        .stats-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.8), rgba(14, 15, 43, 0.9));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .stats-section h3 {
            color: #00ffff;
            margin-bottom: 1rem;
            text-align: center;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }

        .stat-item {
            text-align: center;
            padding: 1rem;
            background: rgba(0, 255, 255, 0.05);
            border-radius: 10px;
            border: 1px solid rgba(0, 255, 255, 0.1);
        }

        .stat-number {
            font-size: 2rem;
            color: #00ffff;
            font-weight: 700;
            display: block;
        }

        .stat-label {
            color: #b8c5d6;
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
            
            .logout-btn {
                position: static;
                margin-top: 1rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-container">
        <div class="dashboard-header">
            <a href="Login.aspx" class="logout-btn" onclick="return confirmLogout();">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
            <h1>Admin Dashboard</h1>
            <p class="welcome-text">Welcome back, <asp:Label ID="lblAdminName" runat="server" Text="Admin"></asp:Label>!</p>
            <p style="color: #b8c5d6;">Manage your portfolio content from here</p>
        </div>

        <div class="stats-section">
            <h3>Quick Statistics</h3>
            <div class="stats-grid">
                <div class="stat-item">
                    <span class="stat-number"><asp:Label ID="lblTotalJudges" runat="server" Text="0"></asp:Label></span>
                    <div class="stat-label">Total Judges</div>
                </div>
                <div class="stat-item">
                    <span class="stat-number"><asp:Label ID="lblActiveJudges" runat="server" Text="0"></asp:Label></span>
                    <div class="stat-label">Active Judges</div>
                </div>
                <div class="stat-item">
                    <span class="stat-number"><asp:Label ID="lblTotalSolves" runat="server" Text="0"></asp:Label></span>
                    <div class="stat-label">Total Solves</div>
                </div>
            </div>
        </div>

        <div class="dashboard-grid">
            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-plus-circle"></i>
                </div>
                <h3 class="card-title">Add Judge</h3>
                <p class="card-description">Add new competitive programming platform entries to showcase your achievements</p>
                <a href="OnlineJudgeManagement.aspx" class="card-button">
                    <i class="fas fa-plus"></i> Add New Judge
                </a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-list"></i>
                </div>
                <h3 class="card-title">View Judges</h3>
                <p class="card-description">View, edit, and manage all existing online judge entries and their details</p>
                <a href="ViewJudges.aspx" class="card-button">
                    <i class="fas fa-eye"></i> View All Judges
                </a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-chart-bar"></i>
                </div>
                <h3 class="card-title">Analytics</h3>
                <p class="card-description">View detailed statistics and analytics about your competitive programming journey</p>
                <a href="#" class="card-button">
                    <i class="fas fa-chart-line"></i> View Analytics
                </a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-cog"></i>
                </div>
                <h3 class="card-title">Settings</h3>
                <p class="card-description">Configure system settings and manage your admin preferences</p>
                <a href="#" class="card-button">
                    <i class="fas fa-cogs"></i> Settings
                </a>
            </div>
        </div>
    </div>

    <script>
        function confirmLogout() {
            return confirm('Are you sure you want to logout?');
        }
    </script>
</asp:Content>