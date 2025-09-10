<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Portfolio.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles/home.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <div class="hero-left">
                <h1 class="hero-title">
                    <span class="greeting">Hi, I'm</span>
                    <span class="name">Kazi Rifat Al Muin</span>
                </h1>
                <h2 class="hero-subtitle">Competitive Programmer & Developer</h2>
                <p class="hero-description">
                    Passionate CSE student at KUET specializing in algorithms, 
                    data structures, and problem-solving with 1500+ problems solved.
                </p>
                <div class="hero-buttons">
                    <a href="About.aspx" class="btn btn-primary">Know More</a>
                    <a href="Contact.aspx" class="btn btn-secondary">Get In Touch</a>
                </div>
            </div>
            <div class="hero-right">
                <div class="profile-image">
                    <img src="images/profile.jpg" alt="Kazi Rifat Al Muin" class="hero-profile-pic" />
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Overview Sections - Now Clickable -->
    <section id="about" class="overview">
        <div class="overview-grid">
            <a href="About.aspx" class="overview-card-link">
                <div class="overview-card">
                    <div class="card-icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <h3>About Me</h3>
                    <p>CSE undergraduate at KUET with passion for competitive programming and software development.</p>
                </div>
            </a>
            
            <a href="Skills.aspx" class="overview-card-link">
                <div class="overview-card">
                    <div class="card-icon">
                        <i class="fas fa-code"></i>
                    </div>
                    <h3>Skills</h3>
                    <p>Expert in C/C++, Java, JavaScript. Strong foundation in algorithms and data structures.</p>
                </div>
            </a>
            
            <a href="Projects.aspx" class="overview-card-link">
                <div class="overview-card">
                    <div class="card-icon">
                        <i class="fas fa-project-diagram"></i>
                    </div>
                    <h3>Projects</h3>
                    <p>Campus Bazar, Numerical Methods, Code Drive and various competitive programming solutions.</p>
                </div>
            </a>
            
            <a href="Education.aspx" class="overview-card-link">
                <div class="overview-card">
                    <div class="card-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3>Education</h3>
                    <p>Currently pursuing Bachelor's in CSE at KUET. HSC from Govt. M.M. City College.</p>
                </div>
            </a>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats">
        <div class="stats-grid">
            <div class="stat-item">
                <span class="stat-number" data-count="1500">0</span>
                <span class="stat-label">Problems Solved</span>
            </div>
            <div class="stat-item">
                <span class="stat-number" data-count="5">0</span>
                <span class="stat-label">Projects</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">Specialist</span>
                <span class="stat-label">Codeforces</span>
            </div>
            <div class="stat-item">
                <span class="stat-number" data-count="26" data-start="100" data-direction="down">Top 100</span>
                <span class="stat-label">IUPC Rank</span>
            </div>
        </div>
    </section>

    <!-- Social Links -->
    <section class="social">
        <h3>Connect With Me</h3>
        <div class="social-links">
            <a href="https://github.com/KaziRifatAlMuin" class="social-link"><i class="fab fa-github"></i></a>
            <a href="https://linkedin.com/in/rifatalmuin" class="social-link"><i class="fab fa-linkedin"></i></a>
            <a href="https://codeforces.com/profile/RifatALmuiN" class="social-link"><i class="fas fa-code"></i></a>
            <a href="https://facebook.com/rifatalmuin21" class="social-link"><i class="fab fa-facebook"></i></a>
        </div>
    </section>

    <!-- Admin Login Section -->
    <section class="admin-login-section">
        <div class="admin-login-container">
            <a href="Admin/Login.aspx" class="admin-login-btn">
                <i class="fas fa-user-shield"></i>
                <span>Admin Login</span>
            </a>
        </div>
    </section>

    <script src="scripts/home.js"></script>
</asp:Content>