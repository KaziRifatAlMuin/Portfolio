<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Portfolio.Admin.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: linear-gradient(135deg, rgba(14, 15, 43, 0.9) 0%, rgba(16, 7, 43, 0.8) 100%);
        }
        
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            padding: 2rem;
        }

        .login-form {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.9), rgba(14, 15, 43, 1));
            border: 1px solid rgba(0, 255, 255, 0.2);
            border-radius: 20px;
            padding: 3rem;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(20px);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h1 {
            color: #00ffff;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
        }

        .login-header p {
            color: #b8c5d6;
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            color: #00ffff;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            background: rgba(0, 255, 255, 0.05);
            border: 1px solid rgba(0, 255, 255, 0.2);
            border-radius: 10px;
            color: #ffffff;
            padding: 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: #00ffff;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.3);
            outline: none;
        }

        .btn-login {
            width: 100%;
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #000;
            border: none;
            border-radius: 10px;
            padding: 1rem;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 255, 255, 0.4);
        }

        .error-message {
            background: rgba(255, 0, 0, 0.1);
            border: 1px solid rgba(255, 0, 0, 0.3);
            border-radius: 8px;
            color: #ff4444;
            padding: 1rem;
            margin-bottom: 1rem;
            text-align: center;
        }

        .success-message {
            background: rgba(0, 255, 0, 0.1);
            border: 1px solid rgba(0, 255, 0, 0.3);
            border-radius: 8px;
            color: #00ff00;
            padding: 1rem;
            margin-bottom: 1rem;
            text-align: center;
        }

        .back-link {
            text-align: center;
            margin-top: 2rem;
        }

        .back-link a {
            color: #00ffff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-link a:hover {
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
        }

        .validation-error {
            color: #ff4444;
            font-size: 0.9rem;
            margin-top: 0.5rem;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <div class="login-form">
            <div class="login-header">
                <h1><i class="fas fa-user-shield"></i> Admin Login</h1>
                <p>Enter your credentials to access the admin dashboard</p>
            </div>

            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

            <div class="form-group">
                <label for="<%= txtUsername.ClientID %>">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                    ControlToValidate="txtUsername" 
                    ErrorMessage="Username is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="<%= txtPassword.ClientID %>">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                    ControlToValidate="txtPassword" 
                    ErrorMessage="Password is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

            <div class="back-link">
                <a href="../Home.aspx"><i class="fas fa-arrow-left"></i> Back to Home</a>
            </div>
            
            <div style="margin-top: 2rem; text-align: center; color: #b8c5d6; font-size: 0.9rem;">
                <p><strong>Demo Credentials:</strong></p>
                <p>Username: <code style="color: #00ffff;">admin</code></p>
                <p>Password: <code style="color: #00ffff;">admin123</code></p>
            </div>
        </div>
    </div>
</asp:Content>