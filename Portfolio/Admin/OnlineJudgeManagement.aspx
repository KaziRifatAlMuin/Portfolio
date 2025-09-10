<%@ Page Title="Online Judge Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OnlineJudgeManagement.aspx.cs" Inherits="Portfolio.Admin.OnlineJudgeManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ===== ADMIN PAGE STYLES ===== */
        .admin-container {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 1rem;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .admin-header {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.95), rgba(14, 15, 43, 1));
            border: 1px solid rgba(0, 255, 255, 0.25);
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }
        
        .admin-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(0, 255, 255, 0.05), transparent);
            animation: shimmer 3s ease-in-out infinite;
        }
        
        @keyframes shimmer {
            0%, 100% { transform: translateX(-100%); }
            50% { transform: translateX(100%); }
        }
        
        .admin-header h1 {
            color: #00ffff;
            font-size: 2.8rem;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 25px rgba(0, 255, 255, 0.6);
            position: relative;
            z-index: 1;
        }
        
        .admin-header .subtitle {
            color: #b8c5d6;
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
        }
        
        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            flex-wrap: wrap;
            position: relative;
            z-index: 1;
        }
        
        .nav-btn {
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.2), rgba(64, 224, 208, 0.3));
            color: #00ffff;
            border: 1px solid rgba(0, 255, 255, 0.4);
            border-radius: 12px;
            padding: 0.8rem 1.5rem;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .nav-btn:hover {
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.3), rgba(64, 224, 208, 0.4));
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 255, 255, 0.3);
            color: #ffffff;
        }
        
        /* ===== FORM SECTION ===== */
        .form-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.85), rgba(14, 15, 43, 0.95));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .form-section h3 {
            color: #00ffff;
            font-size: 1.8rem;
            margin-bottom: 2rem;
            text-align: center;
            text-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            display: flex;
            flex-direction: column;
        }
        
        .form-group label {
            color: #00ffff;
            margin-bottom: 0.8rem;
            font-weight: 600;
            font-size: 1rem;
            text-shadow: 0 0 8px rgba(0, 255, 255, 0.3);
        }
        
        .form-control {
            background: rgba(0, 255, 255, 0.08);
            border: 1px solid rgba(0, 255, 255, 0.25);
            border-radius: 10px;
            color: #ffffff;
            padding: 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            font-family: inherit;
        }
        
        .form-control:focus {
            border-color: #00ffff;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
            outline: none;
            background: rgba(0, 255, 255, 0.12);
        }
        
        .form-control::placeholder {
            color: rgba(184, 197, 214, 0.6);
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            margin-top: 1rem;
            padding: 1rem;
            background: rgba(0, 255, 255, 0.05);
            border-radius: 10px;
            border: 1px solid rgba(0, 255, 255, 0.1);
        }
        
        .checkbox-group input[type="checkbox"] {
            width: 20px;
            height: 20px;
            accent-color: #00ffff;
        }
        
        .checkbox-group label {
            margin: 0;
            cursor: pointer;
        }
        
        /* ===== BUTTONS ===== */
        .button-row {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 2rem;
        }
        
        .btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1rem;
            min-width: 140px;
            justify-content: center;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #000;
            box-shadow: 0 4px 15px rgba(0, 255, 255, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 255, 255, 0.5);
            background: linear-gradient(135deg, #40e0d0, #00ffff);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #666, #999);
            color: #fff;
            box-shadow: 0 4px 15px rgba(102, 102, 102, 0.3);
        }
        
        .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(102, 102, 102, 0.5);
            background: linear-gradient(135deg, #777, #aaa);
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #ffa500, #ff8c00);
            color: #000;
            box-shadow: 0 4px 15px rgba(255, 165, 0, 0.3);
        }
        
        .btn-warning:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.5);
        }
        
        /* ===== MESSAGES ===== */
        .message {
            padding: 1.2rem 1.5rem;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 600;
            font-size: 1rem;
            border: 1px solid;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .message.success {
            background: linear-gradient(135deg, rgba(0, 255, 0, 0.15), rgba(50, 205, 50, 0.2));
            border-color: rgba(0, 255, 0, 0.4);
            color: #00ff88;
            box-shadow: 0 4px 15px rgba(0, 255, 0, 0.2);
        }
        
        .message.error {
            background: linear-gradient(135deg, rgba(255, 0, 0, 0.15), rgba(255, 68, 68, 0.2));
            border-color: rgba(255, 0, 0, 0.4);
            color: #ff6b6b;
            box-shadow: 0 4px 15px rgba(255, 0, 0, 0.2);
        }
        
        /* ===== DATA TABLE ===== */
        .table-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.85), rgba(14, 15, 43, 0.95));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }
        
        .table-section h3 {
            color: #00ffff;
            font-size: 1.8rem;
            margin-bottom: 2rem;
            text-align: center;
            text-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
        }
        
        .data-table {
            width: 100%;
            border-collapse: collapse;
            background: transparent;
            border-radius: 15px;
            overflow: hidden;
        }
        
        .data-table th {
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.15), rgba(64, 224, 208, 0.2));
            color: #00ffff;
            padding: 1.2rem;
            text-align: left;
            font-weight: 700;
            font-size: 1rem;
            border-bottom: 2px solid rgba(0, 255, 255, 0.3);
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
        }
        
        .data-table td {
            padding: 1.2rem;
            border-bottom: 1px solid rgba(0, 255, 255, 0.1);
            color: #e1e5f2;
            vertical-align: middle;
        }
        
        .data-table tr {
            transition: all 0.3s ease;
        }
        
        .data-table tbody tr:hover {
            background: rgba(0, 255, 255, 0.08);
            transform: scale(1.005);
        }
        
        .table-link {
            color: #00ffff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .table-link:hover {
            color: #40e0d0;
            text-shadow: 0 0 8px rgba(0, 255, 255, 0.6);
        }
        
        .status-active {
            color: #00ff88;
            font-weight: 600;
        }
        
        .status-inactive {
            color: #ff6b6b;
            font-weight: 600;
        }
        
        /* ===== ACTION BUTTONS IN TABLE ===== */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
            justify-content: center;
        }
        
        .btn-small {
            padding: 0.6rem 1rem;
            font-size: 0.9rem;
            min-width: auto;
        }
        
        .btn-edit {
            background: linear-gradient(135deg, #40e0d0, #00ffff);
            color: #000;
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #ff4444, #cc0000);
            color: #fff;
        }
        
        /* ===== VALIDATION STYLES ===== */
        .validation-error {
            color: #ff6b6b;
            font-size: 0.9rem;
            margin-top: 0.5rem;
            display: block;
        }
        
        /* ===== RESPONSIVE DESIGN ===== */
        @media (max-width: 968px) {
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .admin-header h1 {
                font-size: 2.2rem;
            }
            
            .nav-buttons {
                flex-direction: column;
                align-items: center;
            }
        }
        
        @media (max-width: 768px) {
            .admin-container {
                padding: 0 0.5rem;
            }
            
            .admin-header {
                padding: 2rem 1rem;
            }
            
            .form-section, .table-section {
                padding: 1.5rem;
            }
            
            .data-table {
                font-size: 0.85rem;
            }
            
            .data-table th,
            .data-table td {
                padding: 0.8rem 0.6rem;
            }
            
            .button-row {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 250px;
            }
        }
        
        /* ===== LOADING ANIMATION ===== */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(0, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: #00ffff;
            animation: spin 1s ease-in-out infinite;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <!-- Admin Header -->
        <div class="admin-header">
            <h1>🎯 Online Judge Management</h1>
            <p class="subtitle">Manage competitive programming platform entries for the skills section</p>
            <div class="nav-buttons">
                <a href="Dashboard.aspx" class="nav-btn">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a href="ViewJudges.aspx" class="nav-btn">
                    <i class="fas fa-list"></i> View All Judges
                </a>
                <a href="../Skills.aspx" class="nav-btn" target="_blank">
                    <i class="fas fa-external-link-alt"></i> Preview Skills Page
                </a>
            </div>
        </div>

        <!-- Message Display -->
        <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

        <!-- Add/Edit Form Section -->
        <div class="form-section">
            <h3>📝 Add/Edit Online Judge Entry</h3>
            <asp:HiddenField ID="hdnJudgeId" runat="server" Value="0" />
            
            <div class="form-row">
                <div class="form-group">
                    <label for="<%= txtJudgeName.ClientID %>">🏆 Judge Name *</label>
                    <asp:TextBox ID="txtJudgeName" runat="server" CssClass="form-control" 
                        placeholder="e.g., Codeforces, CodeChef, LeetCode"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvJudgeName" runat="server" ControlToValidate="txtJudgeName" 
                        ErrorMessage="Judge Name is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                    <asp:RegularExpressionValidator ID="revJudgeName" runat="server" ControlToValidate="txtJudgeName"
                        ValidationExpression="^[a-zA-Z0-9\s\-_.]+$" ErrorMessage="Judge name contains invalid characters"
                        CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                </div>
                
                <div class="form-group">
                    <label for="<%= txtSolveCount.ClientID %>">🔢 Solve Count *</label>
                    <asp:TextBox ID="txtSolveCount" runat="server" CssClass="form-control" TextMode="Number" 
                        placeholder="e.g., 850" min="0" max="999999"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSolveCount" runat="server" ControlToValidate="txtSolveCount" 
                        ErrorMessage="Solve Count is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                    <asp:RangeValidator ID="rvSolveCount" runat="server" ControlToValidate="txtSolveCount" 
                        MinimumValue="0" MaximumValue="999999" Type="Integer"
                        ErrorMessage="Solve Count must be between 0 and 999,999" CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group" style="grid-column: 1 / -1;">
                    <label for="<%= txtProfileLink.ClientID %>">🔗 Profile Link *</label>
                    <asp:TextBox ID="txtProfileLink" runat="server" CssClass="form-control" 
                        placeholder="https://codeforces.com/profile/username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProfileLink" runat="server" ControlToValidate="txtProfileLink" 
                        ErrorMessage="Profile Link is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                    <asp:RegularExpressionValidator ID="revProfileLink" runat="server" ControlToValidate="txtProfileLink"
                        ValidationExpression="^https?://[^\s/$.?#].[^\s]*$" ErrorMessage="Please enter a valid URL (starting with http:// or https://)"
                        CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <div class="checkbox-group">
                        <asp:CheckBox ID="chkDisplay" runat="server" Checked="true" />
                        <label for="<%= chkDisplay.ClientID %>">👁️ Display on Skills Page</label>
                    </div>
                    <small style="color: #b8c5d6; margin-top: 0.5rem; display: block;">
                        When checked, this entry will be visible on the public skills page
                    </small>
                </div>
                
                <div class="form-group">
                    <div style="margin-top: 1rem; padding: 1rem; background: rgba(0, 255, 255, 0.05); border-radius: 10px; border: 1px solid rgba(0, 255, 255, 0.1);">
                        <small style="color: #b8c5d6;">