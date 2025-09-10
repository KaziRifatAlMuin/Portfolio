<%@ Page Title="Admin Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Portfolio.Admin.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login - Portfolio</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .login-container {
            width: 100%;
            max-width: 450px;
        }

        .login-form {
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.9), rgba(14, 15, 43, 1));
            border: 1px solid rgba(0, 255, 255, 0.25);
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(20px);
            position: relative;
            overflow: hidden;
        }

        .login-form::before {
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

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
        }

        .login-header h1 {
            color: #00ffff;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 25px rgba(0, 255, 255, 0.6);
        }

        .login-header p {
            color: #b8c5d6;
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
        }

        .form-group label {
            display: block;
            color: #00ffff;
            margin-bottom: 0.5rem;
            font-weight: 500;
            text-shadow: 0 0 8px rgba(0, 255, 255, 0.3);
        }

        .form-control {
            width: 100%;
            background: rgba(0, 255, 255, 0.08);
            border: 1px solid rgba(0, 255, 255, 0.25);
            border-radius: 12px;
            color: #ffffff;
            padding: 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            font-family: inherit;
        }

        .form-control:focus {
            border-color: #00ffff;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.4);
            outline: none;
            background: rgba(0, 255, 255, 0.12);
        }

        .form-control::placeholder {
            color: rgba(184, 197, 214, 0.6);
        }

        .btn-login {
            width: 100%;
            background: linear-gradient(135deg, #00ffff, #40e0d0);
            color: #000;
            border: none;
            border-radius: 12px;
            padding: 1rem;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
            position: relative;
            z-index: 1;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(0, 255, 255, 0.5);
            background: linear-gradient(135deg, #40e0d0, #00ffff);
        }

        .message {
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 500;
            position: relative;
            z-index: 1;
        }

        .error-message {
            background: rgba(255, 0, 0, 0.15);
            border: 1px solid rgba(255, 0, 0, 0.4);
            color: #ff6b6b;
        }

        .success-message {
            background: rgba(0, 255, 0, 0.15);
            border: 1px solid rgba(0, 255, 0, 0.4);
            color: #00ff88;
        }

        .back-link {
            text-align: center;
            margin-top: 2rem;
            position: relative;
            z-index: 1;
        }

        .back-btn {
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.2), rgba(64, 224, 208, 0.3));
            color: #00ffff;
            border: 1px solid rgba(0, 255, 255, 0.4);
            border-radius: 10px;
            padding: 0.8rem 1.5rem;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .back-btn:hover {
            background: linear-gradient(135deg, rgba(0, 255, 255, 0.3), rgba(64, 224, 208, 0.4));
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 255, 255, 0.3);
            color: #ffffff;
        }

        .validation-error {
            color: #ff6b6b;
            font-size: 0.9rem;
            margin-top: 0.5rem;
            display: block;
        }

        @media (max-width: 480px) {
            body {
                padding: 1rem;
            }
            
            .login-form {
                padding: 2rem 1.5rem;
            }
            
            .login-header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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

                <asp:Button ID="btnLogin" runat="server" Text="🔐 Login to Dashboard" CssClass="btn-login" OnClick="btnLogin_Click" />

                <div class="back-link">
                    <a href="../Home.aspx" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Back to Portfolio
                    </a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>