<%@ Page Title="Online Judge Management" Language="C#" AutoEventWireup="true" CodeBehind="OnlineJudgeManagement.aspx.cs" Inherits="Portfolio.Admin.OnlineJudgeManagement" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Judge Management - Portfolio</title>
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

        .admin-container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .admin-header {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.9), rgba(14, 15, 43, 1));
            border: 1px solid rgba(0, 255, 255, 0.25);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
        }
        
        .admin-header h1 {
            color: #00ffff;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 25px rgba(0, 255, 255, 0.6);
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
        
        .form-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.85), rgba(14, 15, 43, 0.95));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
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
            margin-bottom: 0.5rem;
            font-weight: 600;
        }
        
        .form-control {
            background: rgba(0, 255, 255, 0.08);
            border: 1px solid rgba(0, 255, 255, 0.25);
            border-radius: 10px;
            color: #ffffff;
            padding: 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #00ffff;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.4);
            outline: none;
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
        }
        
        .checkbox-group input[type="checkbox"] {
            width: 20px;
            height: 20px;
            accent-color: #00ffff;
        }
        
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
            font-size: 1rem;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #000;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 255, 255, 0.5);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #666, #999);
            color: #fff;
        }
        
        .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(102, 102, 102, 0.5);
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #ffa500, #ff8c00);
            color: #000;
        }
        
        .btn-warning:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.5);
        }
        
        .message {
            padding: 1rem;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 600;
        }
        
        .message.success {
            background: linear-gradient(135deg, rgba(0, 255, 0, 0.15), rgba(50, 205, 50, 0.2));
            border: 1px solid rgba(0, 255, 0, 0.4);
            color: #00ff88;
        }
        
        .message.error {
            background: linear-gradient(135deg, rgba(255, 0, 0, 0.15), rgba(255, 68, 68, 0.2));
            border: 1px solid rgba(255, 0, 0, 0.4);
            color: #ff6b6b;
        }
        
        .table-section {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.85), rgba(14, 15, 43, 0.95));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            padding: 2rem;
        }
        
        .table-section h3 {
            color: #00ffff;
            font-size: 1.8rem;
            margin-bottom: 2rem;
            text-align: center;
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
        }
        
        .table-link:hover {
            color: #40e0d0;
        }
        
        .btn-small {
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
            margin: 0 0.25rem;
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
        
        .validation-error {
            color: #ff6b6b;
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }
        
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .back-portfolio-btn {
                position: static;
                margin-bottom: 1rem;
            }
            
            .admin-header {
                padding: 1.5rem;
            }
            
            .form-section, .table-section {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-container">
            <div class="admin-header">
                <a href="../Home.aspx" class="back-portfolio-btn">
                    <i class="fas fa-arrow-left"></i> Back to Portfolio
                </a>
                <h1>📝 Judge Management</h1>
                <p style="color: #b8c5d6;">Add, edit, and manage online judge entries</p>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

            <div class="form-section">
                <h3>Add/Edit Judge Entry</h3>
                <asp:HiddenField ID="hdnJudgeId" runat="server" Value="0" />
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="<%= txtJudgeName.ClientID %>">Judge Name *</label>
                        <asp:TextBox ID="txtJudgeName" runat="server" CssClass="form-control" 
                            placeholder="e.g., Codeforces, CodeChef"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvJudgeName" runat="server" ControlToValidate="txtJudgeName" 
                            ErrorMessage="Judge Name is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                    </div>
                    
                    <div class="form-group">
                        <label for="<%= txtSolveCount.ClientID %>">Solve Count *</label>
                        <asp:TextBox ID="txtSolveCount" runat="server" CssClass="form-control" TextMode="Number" 
                            placeholder="e.g., 850"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSolveCount" runat="server" ControlToValidate="txtSolveCount" 
                            ErrorMessage="Solve Count is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group" style="grid-column: 1 / -1;">
                        <label for="<%= txtProfileLink.ClientID %>">Profile Link *</label>
                        <asp:TextBox ID="txtProfileLink" runat="server" CssClass="form-control" 
                            placeholder="https://codeforces.com/profile/username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProfileLink" runat="server" ControlToValidate="txtProfileLink" 
                            ErrorMessage="Profile Link is required" CssClass="validation-error" Display="Dynamic" ValidationGroup="Judge" />
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <div class="checkbox-group">
                            <asp:CheckBox ID="chkDisplay" runat="server" Checked="true" />
                            <label for="<%= chkDisplay.ClientID %>">Display on Skills Page</label>
                        </div>
                    </div>
                </div>
                
                <div class="button-row">
                    <asp:Button ID="btnSave" runat="server" Text="💾 Save Entry" CssClass="btn btn-primary" 
                        OnClick="btnSave_Click" ValidationGroup="Judge" />
                    <asp:Button ID="btnClear" runat="server" Text="🔄 Clear" CssClass="btn btn-warning" 
                        OnClick="btnClear_Click" CausesValidation="false" />
                    <a href="Dashboard.aspx" class="btn btn-secondary">❌ Back to Dashboard</a>
                </div>
            </div>

            <div class="table-section">
                <h3>Current Entries</h3>
                <asp:GridView ID="gvOnlineJudges" runat="server" CssClass="data-table" AutoGenerateColumns="false"
                    OnRowCommand="gvOnlineJudges_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="JudgeName" HeaderText="Judge Name" />
                        <asp:BoundField DataField="SolveCount" HeaderText="Solve Count" />
                        <asp:TemplateField HeaderText="Profile Link">
                            <ItemTemplate>
                                <a href='<%# Eval("ProfileLink") %>' target="_blank" class="table-link">View</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Display">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Display")) ? "Yes" : "No" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="EditJudge" 
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-edit btn-small" CausesValidation="false" />
                                <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteJudge" 
                                    CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-delete btn-small" CausesValidation="false"
                                    OnClientClick="return confirm('Are you sure you want to delete this entry?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align: center; padding: 2rem; color: #b8c5d6;">
                            No judge entries found. Add your first entry above.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>