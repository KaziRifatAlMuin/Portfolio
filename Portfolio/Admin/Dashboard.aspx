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
        /* Reset all default browser styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Main body styling with dark gradient background */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, rgba(14, 15, 43, 0.95) 0%, rgba(16, 7, 43, 0.9) 100%);
            min-height: 100vh;
            padding: 1rem;
            color: #ffffff;
        }

        /* Main container to center and limit content width */
        .dashboard-container {
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Header section with gradient background and relative positioning for buttons */
        .dashboard-header {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.9), rgba(14, 15, 43, 1));
            border: 1px solid rgba(0, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
        }

        /* Main heading with cyan color and glow effect */
        .dashboard-header h1 {
            color: #00ffff;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
        }

        /* Welcome text styling */
        .welcome-text {
            color: #b8c5d6;
            font-size: 1.1rem;
            margin-bottom: 1rem;
        }

        /* Back to portfolio button positioned top-left */
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

        /* Hover effect for back button */
        .back-portfolio-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 102, 102, 0.4);
            color: #fff;
        }

        /* Logout button positioned top-right */
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

        /* Hover effect for logout button */
        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 68, 68, 0.4);
        }

        /* Table selector section container */
        .table-selector {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.85), rgba(14, 15, 43, 0.95));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        /* Table selector heading */
        .table-selector h3 {
            color: #00ffff;
            margin-bottom: 1rem;
            font-size: 1.4rem;
        }

        /* Dropdown styling with black background and white text */
        .table-dropdown, .form-control select, #ddlSkillType {
            background: #000000 !important;
            border: 2px solid #00ffff !important;
            border-radius: 10px;
            color: #ffffff !important;
            padding: 1rem;
            font-size: 0.9rem;
            min-width: 250px;
            font-weight: 500;
            transition: all 0.3s ease;
            appearance: none;
            background-image: url('data:image/svg+xml;charset=US-ASCII,<svg xmlns="http://www.w3.org/2000/svg" width="4" height="5" viewBox="0 0 4 5"><path fill="%23ffffff" d="M2 0L0 2h4zm0 5L0 3h4z"/></svg>') !important;
            background-repeat: no-repeat !important;
            background-position: right 1rem center !important;
            background-size: 12px !important;
        }

        /* Dropdown focus state */
        .table-dropdown:focus, .form-control select:focus, #ddlSkillType:focus {
            border-color: #40e0d0 !important;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.4) !important;
            outline: none !important;
            background-color: #111111 !important;
        }

        /* Dropdown option styling */
        .table-dropdown option, .form-control select option, #ddlSkillType option {
            background: #000000 !important;
            color: #ffffff !important;
            padding: 0.5rem;
            border: none;
        }

        /* Dropdown option hover state */
        .table-dropdown option:hover, .form-control select option:hover, #ddlSkillType option:hover {
            background: #333333 !important;
            color: #00ffff !important;
        }

        /* Selected dropdown option styling */
        .table-dropdown option:checked, .form-control select option:checked, #ddlSkillType option:checked {
            background: #00ffff !important;
            color: #ffffff !important;
            font-weight: 600;
        }

        /* Form section container positioned below table */
        .form-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.85), rgba(14, 15, 43, 0.95));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            margin-top: 2rem;
            order: 2;
        }

        /* Form section heading */
        .form-section h3 {
            color: #00ffff;
            font-size: 1.3rem;
            margin-bottom: 2rem;
            text-align: center;
            text-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
        }

        /* Grid layout for form fields */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        /* Individual form field container */
        .form-group {
            display: flex;
            flex-direction: column;
        }

        /* Form field labels */
        .form-group label {
            color: #00ffff;
            margin-bottom: 0.5rem;
            font-weight: 600;
            font-size: 0.9rem;
        }

        /* Form input controls styling */
        .form-control {
            background: rgba(0, 255, 255, 0.08);
            border: 1px solid rgba(0, 255, 255, 0.25);
            border-radius: 10px;
            color: #ffffff;
            padding: 0.8rem;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        /* Form control focus state */
        .form-control:focus {
            border-color: #00ffff;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
            outline: none;
        }

        /* Placeholder text color */
        .form-control::placeholder {
            color: rgba(184, 197, 214, 0.6);
        }

        /* Large textarea styling */
        .textarea-large {
            min-height: 100px;
            resize: vertical;
        }

        /* Button row container */
        .button-row {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 2rem;
        }

        /* Base button styling */
        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-block;
        }

        /* Primary button (Save) styling */
        .btn-primary {
            background: linear-gradient(135deg, #00ffff, #0000ff);
            color: #ffffff;
        }

        /* Primary button hover effect */
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 255, 255, 0.5);
            color: #ffffff;
        }

        /* Warning button (Clear) styling */
        .btn-warning {
            background: linear-gradient(135deg, #ff0000, #500000);
            color: #ffffff;
        }

        /* Warning button hover effect */
        .btn-warning:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.5);
            color: #ffffff;
        }

        /* Message display styling - smaller and centered */
        .message {
            padding: 0.6rem;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 600;
            font-size: 0.85rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Success message styling */
        .message.success {
            background: linear-gradient(135deg, rgba(0, 255, 0, 0.15), rgba(50, 205, 50, 0.2));
            border: 1px solid rgba(0, 255, 0, 0.4);
            color: #00ff88;
        }

        /* Error message styling */
        .message.error {
            background: linear-gradient(135deg, rgba(255, 0, 0, 0.15), rgba(255, 68, 68, 0.2));
            border: 1px solid rgba(255, 0, 0, 0.4);
            color: #ff6b6b;
        }

        /* Table section container - appears before form */
        .table-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.85), rgba(14, 15, 43, 0.95));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            order: 1;
        }

        /* Table section heading */
        /* Table section heading */
        .table-section h3 {
            color: #00ffff;
            font-size: 1.3rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        /* Data table styling with smaller font */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            font-size: 0.8rem;
        }

        /* Table header styling */
        .data-table th {
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.15), rgba(64, 224, 208, 0.2));
            color: #00ffff;
            padding: 0.7rem;
            text-align: left;
            font-weight: 700;
            border-bottom: 2px solid rgba(0, 255, 255, 0.3);
            font-size: 0.85rem;
        }

        /* Table cell styling */
        .data-table td {
            padding: 0.7rem;
            border-bottom: 1px solid rgba(0, 255, 255, 0.1);
            color: #e1e5f2;
            vertical-align: middle;
            font-size: 0.8rem;
        }

        /* Table row hover effect */
        .data-table tr:hover {
            background: rgba(0, 255, 255, 0.08);
        }

        /* Table link styling */
        .table-link {
            color: #00ffff;
            text-decoration: none;
        }

        /* Table link hover effect */
        .table-link:hover {
            color: #40e0d0;
        }

        /* Small button base styling */
        .btn-small {
            padding: 0.4rem 0.8rem;
            font-size: 0.75rem;
            margin: 0 0.2rem;
            border-radius: 6px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
        }

        /* Edit button styling with cyan colors */
        .btn-edit {
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #ffffff;
        }

        /* Edit button hover effect */
        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 255, 255, 0.4);
            color: #ffffff;
        }

        /* Delete button styling with light red colors */
        .btn-delete {
            background: linear-gradient(135deg, #ff6b6b, #ff5252);
            color: #ffffff;
        }

        /* Delete button hover effect */
        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
            color: #ffffff;
            background: linear-gradient(135deg, #ff5252, #f44336);
        }

        /* CommandField button styling */
        .data-table .commandfield-button {
            background: linear-gradient(135deg, #00ffff, #40e0d0) !important;
            color: #ffffff !important;
            border: none !important;
            border-radius: 6px !important;
            padding: 0.4rem 0.8rem !important;
            font-size: 0.75rem !important;
            font-weight: 600 !important;
            text-decoration: none !important;
            display: inline-block !important;
            margin: 0 0.2rem !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
        }

        /* Edit button specific styling - Deep Blue */
        .data-table input[value*="Edit"], .data-table a[href*="Edit"] {
            background: linear-gradient(135deg, #1e3a8a, #1d4ed8) !important;
            color: #ffffff !important;
            border: none !important;
            border-radius: 6px !important;
            padding: 0.4rem 0.8rem !important;
            font-size: 0.75rem !important;
            font-weight: 600 !important;
            text-decoration: none !important;
            display: inline-block !important;
            margin: 0 0.2rem !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
        }

        /* Delete button specific styling - Normal Red */
        .data-table input[value*="Delete"], .data-table a[href*="Delete"] {
            background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
            color: #ffffff !important;
            border: none !important;
            border-radius: 6px !important;
            padding: 0.4rem 0.8rem !important;
            font-size: 0.75rem !important;
            font-weight: 600 !important;
            text-decoration: none !important;
            display: inline-block !important;
            margin: 0 0.2rem !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
        }

        /* Update button styling - Green */
        .data-table input[value*="Update"] {
            background: linear-gradient(135deg, #16a34a, #15803d) !important;
            color: #ffffff !important;
            border: none !important;
            border-radius: 6px !important;
            padding: 0.4rem 0.8rem !important;
            font-size: 0.75rem !important;
            font-weight: 600 !important;
            margin: 0 0.2rem !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
        }

        /* Cancel button styling - Yellow */
        .data-table input[value*="Cancel"] {
            background: linear-gradient(135deg, #eab308, #ca8a04) !important;
            color: #000000 !important; /* Black text for better contrast on yellow */
            border: none !important;
            border-radius: 6px !important;
            padding: 0.4rem 0.8rem !important;
            font-size: 0.75rem !important;
            font-weight: 600 !important;
            margin: 0 0.2rem !important;
            cursor: pointer !important;
            transition: all 0.3s ease !important;
        }

        /* Hover effects */
        .data-table input[value*="Edit"]:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 5px 15px rgba(30, 58, 138, 0.4) !important;
            background: linear-gradient(135deg, #1d4ed8, #2563eb) !important;
        }

        .data-table input[value*="Delete"]:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 5px 15px rgba(220, 38, 38, 0.4) !important;
            background: linear-gradient(135deg, #b91c1c, #991b1b) !important;
        }

        .data-table input[value*="Update"]:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 5px 15px rgba(22, 163, 74, 0.4) !important;
            background: linear-gradient(135deg, #15803d, #166534) !important;
        }

        .data-table input[value*="Cancel"]:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 5px 15px rgba(234, 179, 8, 0.4) !important;
            background: linear-gradient(135deg, #ca8a04, #a16207) !important;
        }

        /* Validation error message styling */
        .validation-error {
            color: #ff6b6b;
            font-size: 0.8rem;
            margin-top: 0.5rem;
        }

        /* No records found section styling */
        .no-records {
            text-align: center;
            padding: 3rem 2rem;
            color: #b8c5d6;
        }

        /* No records heading */
        .no-records h4 {
            color: #00ffff;
            margin-bottom: 1rem;
            font-size: 1.2rem;
        }

        /* Content wrapper to control display order */
        .content-wrapper {
            display: flex;
            flex-direction: column;
        }

        /* Responsive design for mobile devices */
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }

            .back-portfolio-btn, .logout-btn {
                position: static;
                margin: 0.5rem;
            }

            .dashboard-header {
                padding: 1.5rem;
            }

            .form-section, .table-section {
                padding: 1.5rem;
            }

            .data-table {
                font-size: 0.7rem;
            }

            .data-table th,
            .data-table td {
                padding: 0.5rem;
                font-size: 0.7rem;
            }

            .table-dropdown {
                min-width: 200px;
            }

            .btn-small {
                padding: 0.3rem 0.6rem;
                font-size: 0.7rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <!-- Dashboard Header -->
            <div class="dashboard-header">
                <a href="../Home.aspx" class="back-portfolio-btn">
                    <i class="fas fa-arrow-left"></i> Back to Portfolio
                </a>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="logout-btn" OnClick="btnLogout_Click" OnClientClick="return confirm('Are you sure you want to logout?');">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </asp:LinkButton>
                <h1>🎯 Admin Dashboard</h1>
                <p class="welcome-text">Welcome back, <asp:Label ID="lblAdminName" runat="server" Text="Admin"></asp:Label>!</p>
                <p style="color: #b8c5d6;">Manage your portfolio content</p>
            </div>

            <!-- Table Selector -->
            <div class="table-selector">
                <h3>📋 Select Table to Manage</h3>
                <asp:DropDownList ID="ddlTableSelector" runat="server" CssClass="table-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlTableSelector_SelectedIndexChanged">
                    <asp:ListItem Value="OnlineJudge" Text="🏆 Online Judges" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Projects" Text="🚀 Projects"></asp:ListItem>
                    <asp:ListItem Value="Skills" Text="💻 Skills"></asp:ListItem>
                    <asp:ListItem Value="ICPCHistory" Text="🏅 ICPC History"></asp:ListItem>
                    <asp:ListItem Value="IUPCHistory" Text="🎖️ IUPC History"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Message Display -->
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

            <!-- Content wrapper to control order -->
            <div class="content-wrapper">
                <!-- Records Table - Now appears first -->
                <div class="table-section">
                    <h3>📋 All Records</h3>
                    
                    <asp:Panel ID="pnlNoRecords" runat="server" CssClass="no-records" Visible="false">
                        <h4>📝 No Records Found</h4>
                        <asp:Label ID="lblNoRecordsText" runat="server" Text="No entries found."></asp:Label>
                        <p>Use the form below to add your first entry!</p>
                    </asp:Panel>

                    <asp:GridView ID="gvRecords" runat="server" AutoGenerateColumns="false" CssClass="data-table"
                        OnRowEditing="gvRecords_RowEditing" OnRowCancelingEdit="gvRecords_RowCancelingEdit"
                        OnRowUpdating="gvRecords_RowUpdating" OnRowDeleting="gvRecords_RowDeleting"
                        OnRowDataBound="gvRecords_RowDataBound" EmptyDataText="">
                        <Columns>
                        </Columns>
                    </asp:GridView>
                </div>

                <!-- Add Form - Now appears second -->
                <div class="form-section">
                    <h3><asp:Label ID="lblFormTitle" runat="server" Text="📝 Add Entry"></asp:Label></h3>
                    <asp:HiddenField ID="hdnRecordId" runat="server" Value="0" />
                    
                    <div class="form-row">
                        <!-- Name/Title Field -->
                        <asp:Panel ID="pnlName" runat="server" CssClass="form-group">
                            <asp:Label ID="lblName" runat="server" Text="Name *"></asp:Label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                                ErrorMessage="Name is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>
                        
                        <!-- Solve Count Field -->
                        <asp:Panel ID="pnlSolveCount" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblSolveCount" runat="server" Text="Solve Count *"></asp:Label>
                            <asp:TextBox ID="txtSolveCount" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSolveCount" runat="server" ControlToValidate="txtSolveCount" 
                                ErrorMessage="Solve Count is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>

                        <!-- Percentage Field -->
                        <asp:Panel ID="pnlPercentage" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblPercentage" runat="server" Text="Percentage *"></asp:Label>
                            <asp:TextBox ID="txtPercentage" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPercentage" runat="server" ControlToValidate="txtPercentage" 
                                ErrorMessage="Percentage is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                            <asp:RangeValidator ID="rvPercentage" runat="server" ControlToValidate="txtPercentage" 
                                MinimumValue="0" MaximumValue="100" Type="Integer"
                                ErrorMessage="Percentage must be between 0 and 100" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>

                        <!-- Rank Field -->
                        <asp:Panel ID="pnlRank" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblRank" runat="server" Text="Rank *"></asp:Label>
                            <asp:TextBox ID="txtRank" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvRank" runat="server" ControlToValidate="txtRank" 
                                ErrorMessage="Rank is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>
                    </div>
                    
                    <div class="form-row">
                        <!-- Profile URL Field -->
                        <asp:Panel ID="pnlProfileURL" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblProfileURL" runat="server" Text="Profile URL *"></asp:Label>
                            <asp:TextBox ID="txtProfileURL" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvProfileURL" runat="server" ControlToValidate="txtProfileURL" 
                                ErrorMessage="Profile URL is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>

                        <!-- Image URL Field -->
                        <asp:Panel ID="pnlImageURL" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblImageURL" runat="server" Text="Image URL *"></asp:Label>
                            <asp:TextBox ID="txtImageURL" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvImageURL" runat="server" ControlToValidate="txtImageURL" 
                                ErrorMessage="Image URL is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>

                        <!-- GitHub URL Field for Projects -->
                        <asp:Panel ID="pnlGitHubURL" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblGitHubURL" runat="server" Text="GitHub URL *"></asp:Label>
                            <asp:TextBox ID="txtGitHubURL" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvGitHubURL" runat="server" ControlToValidate="txtGitHubURL" 
                                ErrorMessage="GitHub URL is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>

                        <!-- Skill Type Field -->
                        <asp:Panel ID="pnlSkillType" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblSkillType" runat="server" Text="Skill Type *"></asp:Label>
                            <asp:DropDownList ID="ddlSkillType" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSkillType" runat="server" ControlToValidate="ddlSkillType" 
                                ErrorMessage="Skill Type is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>

                        <!-- Contest Date Field -->
                        <asp:Panel ID="pnlContestDate" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblContestDate" runat="server" Text="Contest Date *"></asp:Label>
                            <asp:TextBox ID="txtContestDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvContestDate" runat="server" ControlToValidate="txtContestDate" 
                                ErrorMessage="Contest Date is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>
                    </div>

                    <div class="form-row">
                        <!-- Display Text Field -->
                        <asp:Panel ID="pnlDisplayText" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblDisplayText" runat="server" Text="Display Text"></asp:Label>
                            <asp:TextBox ID="txtDisplayText" runat="server" CssClass="form-control"></asp:TextBox>
                        </asp:Panel>

                        <!-- Status Field -->
                        <asp:Panel ID="pnlStatus" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblStatus" runat="server" Text="Status *"></asp:Label>
                            <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="txtStatus" 
                                ErrorMessage="Status is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>

                        <!-- Contest URL Field -->
                        <asp:Panel ID="pnlContestURL" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblContestURL" runat="server" Text="Contest URL"></asp:Label>
                            <asp:TextBox ID="txtContestURL" runat="server" CssClass="form-control"></asp:TextBox>
                        </asp:Panel>

                        <!-- Contest Title Field -->
                        <asp:Panel ID="pnlContestTitle" runat="server" CssClass="form-group" Visible="false">
                            <asp:Label ID="lblContestTitle" runat="server" Text="Contest Title *"></asp:Label>
                            <asp:TextBox ID="txtContestTitle" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvContestTitle" runat="server" ControlToValidate="txtContestTitle" 
                                ErrorMessage="Contest Title is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>
                    </div>

                    <div class="form-row">
                        <!-- Description Field -->
                        <asp:Panel ID="pnlDescription" runat="server" CssClass="form-group" Visible="false" style="grid-column: 1 / -1;">
                            <asp:Label ID="lblDescription" runat="server" Text="Description *"></asp:Label>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control textarea-large" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" 
                                ErrorMessage="Description is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                        </asp:Panel>
                    </div>

                    <div class="form-row">
                        <!-- Tags Field -->
                        <asp:Panel ID="pnlTags" runat="server" CssClass="form-group" Visible="false" style="grid-column: 1 / -1;">
                            <asp:Label ID="lblTags" runat="server" Text="Tags *"></asp:Label>
                            <asp:TextBox ID="txtTags" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTags" runat="server" ControlToValidate="txtTags" 
                                ErrorMessage="Tags are required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Entry" />
                            <small style="color: #b8c5d6; margin-top: 0.5rem; display: block;">
                                Separate tags with commas (e.g., ASP.NET,C#,SQL Server,Bootstrap)
                            </small>
                        </asp:Panel>
                    </div>
                    
                    <div class="button-row">
                        <asp:Button ID="btnSave" runat="server" Text="💾 Save Entry" CssClass="btn btn-primary" 
                            OnClick="btnSave_Click" ValidationGroup="Entry" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        // Auto-hide success messages
        document.addEventListener('DOMContentLoaded', function () {
            const successMessage = document.querySelector('.message.success');
            if (successMessage) {
                setTimeout(() => {
                    successMessage.style.opacity = '0';
                    setTimeout(() => {
                        successMessage.style.display = 'none';
                    }, 300);
                }, 4000);
            }
        });

        // Scroll to form when editing
        function scrollToForm() {
            document.querySelector('.form-section').scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    </script>
</body>
</html>