<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Projects.aspx.cs" Inherits="Portfolio.Projects" %>

<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">Projects – My Portfolio</asp:Content>

<asp:Content ID="MainBlock" ContentPlaceHolderID="MainContent" runat="server">
  <div class="card-like">
    <h1 class="h3">Projects</h1>
    <asp:Repeater ID="rptProjects" runat="server">
      <HeaderTemplate><div class="row g-3 mt-2"></HeaderTemplate>
      <ItemTemplate>
        <div class="col-12 col-md-6">
          <div class="card-like h-100">
            <h2 class="h5"><%# Eval("Title") %></h2>
            <p><%# Eval("Description") %></p>
            <a class="btn btn-sm btn-brand text-light" href="<%# Eval("Link") %>" target="_blank">View</a>
          </div>
        </div>
      </ItemTemplate>
      <FooterTemplate></div></FooterTemplate>
    </asp:Repeater>
  </div>
</asp:Content>
