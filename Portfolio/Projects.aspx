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
            <asp:Repeater ID="rptProjects" runat="server">
                <ItemTemplate>
                    <div class="project-card">
                        <!-- Project Image (if exists) or Default Logo -->
                        <div class="project-image">
                            <img src="<%# GetProjectImage(Eval("ImageURL")) %>" alt="<%# Eval("Title") %>" class="project-img" />
                        </div>
                        
                        <!-- Project Icon (dynamic based on title) -->
                        <div class="project-icon">
                            <i class="<%# GetProjectIcon(Eval("Title").ToString()) %>"></i>
                        </div>
                        
                        <h3><%# Eval("Title") %></h3>
                        <p><%# Eval("Description") %></p>
                        <div class="project-tech">
                            <%# GetTagsHtml(Eval("Tags").ToString()) %>
                        </div>
                        <a href="<%# Eval("GitHubURL") %>" target="_blank" class="project-link">
                            <i class="fab fa-github"></i> View Code
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
</asp:Content>