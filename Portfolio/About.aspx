<%@ Page Title="About Me" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PortfolioWebForms.About" %>

<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">About Me – Kazi Rifat Al Muin</asp:Content>

<asp:Content ID="MainBlock" ContentPlaceHolderID="MainContent" runat="server">
    <section id="about" class="section-img">
        <div class="image-container">
            <img src="images/about-bg.jpg" alt="About Me" class="about-image">
        </div>
        <div class="container">
            <h2>About Me</h2>
            <p>
                I'm Kazi Rifat Al Muin, a CSE undergraduate at KUET with a passion for problem-solving and competitive programming. I have a strong foundation in algorithms, data structures, and software development, especially in C and C++. Beyond coding, I enjoy mentoring, cycling, and taking on new challenges.
            </p>
        </div>
    </section>
</asp:Content>
