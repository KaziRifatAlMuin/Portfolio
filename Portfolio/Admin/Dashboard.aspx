<%@ Page Title="Admin Dashboard" Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Portfolio.Admin.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard - Portfolio</title>
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
            padding: 2rem;
        }

        .dashboard-container {
            max-width: 800px;
            margin: 0 auto;
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

        .back-portfolio-btn {
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
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-portfolio-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 102, 102, 0.4);
            color: #fff;
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
            max-width: 700px;
            margin: 0 auto;
        }

        .dashboard-card {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.8), rgba(14, 15, 43, 0.9));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2.5rem;
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
            font-size: 4rem;
            color: #00ffff;
            margin-bottom: 1.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
            position: relative;
            z-index: 1;
        }

        .card-title {
            color: #ffffff;
            font-size: 1.8rem;
            margin-bottom: 1rem;
            position: relative;
            z-index: 1;
        }

        .card-description {
            color: #b8c5d6;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
            line-height: 1.6;
        }

        .card-button {
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #000;
            border: none;
            border-radius: 12px;
            padding: 1rem 2rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            position: relative;
            z-index: 1;
            font-size: 1.1rem;
        }

        .card-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 255, 255, 0.4);
            background: linear-gradient(135deg, #40e0d0, #00ffff);
            color: #000;
        }

        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
            
            .back-portfolio-btn, .logout-btn {
                position: static;
                margin: 0.5rem;
            }
            
            .dashboard-header {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="dashboard-header">
                <a href="../Home.aspx" class="back-portfolio-btn">
                    <i class="fas fa-arrow-left"></i> Back to Portfolio
                </a>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="logout-btn" OnClick="btnLogout_Click" OnClientClick="return confirm('Are you sure you want to logout?');">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </asp:LinkButton>
                <h1>🎯 Admin Dashboard</h1>
                <p class="welcome-text">Welcome back, <asp:Label ID="lblAdminName" runat="server" Text="Admin"></asp:Label>!</p>
                <p style="color: #b8c5d6;">Manage your online judge entries</p>
            </div>

            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <h3 class="card-title">Add Judge</h3>
                    <p class="card-description">Add new competitive programming platform entries to showcase your achievements on the skills page</p>
                    <a href="OnlineJudgeManagement.aspx" class="card-button">
                        <i class="fas fa-plus"></i> Add New Judge
                    </a>
                </div>

                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-list"></i>
                    </div>
                    <h3 class="card-title">View Judges</h3>
                    <p class="card-description">View, edit, and manage all existing online judge entries in a clean table format with edit and delete options</p>
                    <a href="ViewJudges.aspx" class="card-button">
                        <i class="fas fa-eye"></i> View All Judges
                    </a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>