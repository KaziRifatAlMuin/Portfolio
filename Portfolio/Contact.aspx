<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="Portfolio.Contact" %>

<asp:Content ID="TitleBlock" ContentPlaceHolderID="TitleContent" runat="server">Contact – My Portfolio</asp:Content>

<asp:Content ID="MainBlock" ContentPlaceHolderID="MainContent" runat="server">
  <div class="card-like">
    <h1 class="h3">Contact</h1>

    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="error" HeaderText="Please fix the following:" />

    <label for="txtName">Name</label>
    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" CssClass="error" Display="Dynamic" />

    <label for="txtEmail">Email</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="error" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
        ValidationExpression="^\S+@\S+\.\S+$" ErrorMessage="Invalid email format" CssClass="error" Display="Dynamic" />

    <label for="txtMessage">Message</label>
    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
    <asp:RequiredFieldValidator ID="rfvMsg" runat="server" ControlToValidate="txtMessage" ErrorMessage="Message is required" CssClass="error" Display="Dynamic" />

    <div class="mt-3">
      <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-sm btn-brand text-light" OnClick="btnSubmit_Click" />
    </div>

    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="success mt-3">
      Thanks! Your message has been saved.
    </asp:Panel>
  </div>
</asp:Content>
