<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="Portfolio.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles/projects.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-section">
        <div class="section-header">
            <h1>My Projects</h1>
            <p>Some of my notable work and contributions</p>
        </div>

        <div class="projects-grid">
            <div class="project-card">
                <div class="project-icon">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <h3>Campus Bazar</h3>
                <p>An mobile application for online marketplace platform built using Android Studio, specifically designed for university students to buy and sell products within their campus community.</p>
                <div class="project-tech">
                    <span class="tech-tag">Android</span>
                    <span class="tech-tag">Java</span>
                    <span class="tech-tag">Firebase</span>
                </div>
                <a href="https://github.com/KaziRifatAlMuin/Campus-Bazar_Ecommerce-App-Project" target="_blank" class="project-link">
                    <i class="fab fa-github"></i> View Code
                </a>
            </div>

            <div class="project-card">
                <div class="project-icon">
                    <i class="fas fa-calculator"></i>
                </div>
                <h3>Numerical Methods</h3>
                <p>A comprehensive collection of numerical methods implementations in C++, including root finding, interpolation, and differential equations solving techniques.</p>
                <div class="project-tech">
                    <span class="tech-tag">C++</span>
                    <span class="tech-tag">Mathematics</span>
                    <span class="tech-tag">Algorithms</span>
                </div>
                <a href="https://github.com/KaziRifatAlMuin/Numerical-Methods-Console-Application" target="_blank" class="project-link">
                    <i class="fab fa-github"></i> View Code
                </a>
            </div>

            <div class="project-card">
                <div class="project-icon">
                    <i class="fas fa-code"></i>
                </div>
                <h3>Code Drive</h3>
                <p>A collection of solved competitive programming problems from various online judges like CodeForces, AtCoder, and SPOJ, implemented in C++.</p>
                <div class="project-tech">
                    <span class="tech-tag">C++</span>
                    <span class="tech-tag">Algorithms</span>
                    <span class="tech-tag">Data Structures</span>
                </div>
                <a href="https://github.com/KaziRifatAlMuin/CodeDrive" target="_blank" class="project-link">
                    <i class="fab fa-github"></i> View Code
                </a>
            </div>
        </div>
    </section>
</asp:Content>