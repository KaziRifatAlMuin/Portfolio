<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="PortfolioWebForms.Projects" %>

<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">Projects – Kazi Rifat Al Muin</asp:Content>

<asp:Content ID="MainBlock" ContentPlaceHolderID="MainContent" runat="server">
    <section id="projects">
        <div class="container">
            <h2>Projects</h2>
            <div class="projects-list">
                <div class="project">
                    <h3><i class="fas fa-shopping-cart skill-icon"></i> Campus Bazar</h3>
                    <p>An online marketplace platform built using MERN stack, specifically designed for university students to buy and sell products within their campus community.</p>
                    <a href="https://github.com/KaziRifatAlMuin/Campus-Bazar_Ecommerce-App-Project" target="_blank" class="view-on-github">View on GitHub</a>
                </div>
                <div class="project">
                    <h3><i class="fas fa-calculator skill-icon"></i> Numerical Methods</h3>
                    <p>A comprehensive collection of numerical methods implementations in C++, including root finding, interpolation, and differential equations solving techniques.</p>
                    <a href="https://github.com/KaziRifatAlMuin/Numerical-Methods-Console-Application" target="_blank" class="view-on-github">View on GitHub</a>
                </div>
                <div class="project">
                    <h3><i class="fas fa-code skill-icon"></i> Code Drive</h3>
                    <p>A collection of solved competitive programming problems from various online judges like CodeForces, AtCoder, and SPOJ, implemented in C++.</p>
                    <a href="https://github.com/KaziRifatAlMuin/CodeDrive" target="_blank" class="view-on-github">View on GitHub</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
