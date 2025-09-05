<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PortfolioWebForms._Default" %>
<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">Home – My Portfolio</asp:Content>
<asp:Content ID="MainBlock" ContentPlaceHolderID="MainContent" runat="server">
  <div class="card-like">
    <h1 class="h3">Hi, I’m Your Name 👋</h1>
    <p class="mb-3">This is your ASP.NET Web Forms portfolio starter. Use the navbar to explore pages.</p>
    <a class="btn btn-sm btn-brand text-light" href="Projects.aspx">See Projects</a>
  </div>
</asp:Content>
