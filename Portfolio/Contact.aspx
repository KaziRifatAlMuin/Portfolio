<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Portfolio.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles/contact.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-section">
        <div class="section-header">
            <h1>Get In Touch</h1>
            <p>Let's connect and discuss opportunities</p>
        </div>

        <div class="contact-content">
            <div class="contact-info">
                <div class="contact-item">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="contact-details">
                        <h4>Email</h4>
                        <p>kazirifatalmuin246@gmail.com</p>
                    </div>
                </div>

                <div class="contact-item">
                    <div class="contact-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="contact-details">
                        <h4>Location</h4>
                        <p>Khulna, Bangladesh</p>
                    </div>
                </div>

                <div class="contact-item">
                    <div class="contact-icon">
                        <i class="fas fa-phone"></i>
                    </div>
                    <div class="contact-details">
                        <h4>Phone</h4>
                        <p>+880 1793 299246</p>
                    </div>
                </div>

                <div class="social-section">
                    <h4>Follow Me</h4>
                    <div class="social-links">
                        <a href="https://github.com/KaziRifatAlMuin" class="social-link"><i class="fab fa-github"></i></a>
                        <a href="https://linkedin.com/in/rifatalmuin" class="social-link"><i class="fab fa-linkedin"></i></a>
                        <a href="https://codeforces.com/profile/RifatALmuiN" class="social-link"><i class="fas fa-code"></i></a>
                        <a href="https://facebook.com/rifatalmuin21" class="social-link"><i class="fab fa-facebook"></i></a>
                    </div>
                </div>
            </div>

            <div class="contact-form">
                <asp:TextBox ID="txtName" runat="server" placeholder="Your Name" CssClass="form-input"></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email" TextMode="Email" CssClass="form-input"></asp:TextBox>
                <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject" CssClass="form-input"></asp:TextBox>
                <asp:TextBox ID="txtMessage" runat="server" placeholder="Your Message" TextMode="MultiLine" Rows="5" CssClass="form-textarea"></asp:TextBox>
                <asp:Button ID="btnSend" runat="server" Text="Send Message" OnClick="btnSend_Click" CssClass="btn btn-primary" />
                <asp:Label ID="lblMessage" runat="server" CssClass="form-message" Visible="false"></asp:Label>
            </div>
        </div>
    </section>
</asp:Content>