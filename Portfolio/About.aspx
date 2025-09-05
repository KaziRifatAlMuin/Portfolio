<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PortfolioWebForms.About" %>
<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">About – My Portfolio</asp:Content>
<asp:Content ID="MainBlock" ContentPlaceHolderID="MainContent" runat="server">
  <div class="card-like">
    <h1 class="h3">About Me</h1>
    <p>Short bio goes here. Mention your focus areas and goals.</p>
    <ul>
      <li>C#, ASP.NET Web Forms</li>
      <li>HTML & CSS</li>
      <li>SQL basics</li>
    </ul>
  </div>
</asp:Content>
