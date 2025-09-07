<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Portfolio.About" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-section">
        <div class="section-header">
            <h1>About Me</h1>
            <p>Get to know more about my journey and interests</p>
        </div>

        <!-- 4 Column Quick Info -->
        <div class="about-quick-info">
            <div class="info-card">
                <div class="info-icon">
                    <i class="fas fa-user-circle"></i>
                </div>
                <h3>Who I Am</h3>
                <p>Passionate CSE student solving complex programming challenges daily</p>
            </div>
            
            <div class="info-card">
                <div class="info-icon">
                    <i class="fas fa-heart"></i>
                </div>
                <h3>What I Love</h3>
                <p>Competitive programming and building innovative software solutions together</p>
            </div>
            
            <div class="info-card">
                <div class="info-icon">
                    <i class="fas fa-bullseye"></i>
                </div>
                <h3>My Goals</h3>
                <p>Becoming skilled software engineer while excelling in programming</p>
            </div>
            
            <div class="info-card">
                <div class="info-icon">
                    <i class="fas fa-gamepad"></i>
                </div>
                <h3>Interests</h3>
                <p>Gaming, Cycling, Mentoring students and junior programmers and Watching Tech Videos</p>
            </div>
        </div>

        <!-- Photo Gallery with Fixed 3-Photo Layout -->
        <div class="photo-gallery">
            <div class="gallery-header">
                <h2>My Journey</h2>
                <p>Glimpses from my programming and extra-curricular life</p>
            </div>
            <div class="gallery-container">
                <div class="photo-display">
                    <!-- Always 3 visible photos -->
                    <div class="photo-slot" id="photo-left">
                        <div class="photo-circle">
                            <img src="images/1.jpg" alt="Photo" class="gallery-image" />
                        </div>
                    </div>
                    <div class="photo-slot center" id="photo-center">
                        <div class="photo-circle">
                            <img src="images/2.jpg" alt="Photo" class="gallery-image" />
                        </div>
                    </div>
                    <div class="photo-slot" id="photo-right">
                        <div class="photo-circle">
                            <img src="images/3.jpg" alt="Photo" class="gallery-image" />
                        </div>
                    </div>
                </div>
                <div class="gallery-dots">
                    <span class="dot active" data-index="0"></span>
                    <span class="dot" data-index="1"></span>
                    <span class="dot" data-index="2"></span>
                    <span class="dot" data-index="3"></span>
                    <span class="dot" data-index="4"></span>
                    <span class="dot" data-index="5"></span>
                    <span class="dot" data-index="6"></span>
                    <span class="dot" data-index="7"></span>
                </div>
            </div>
        </div>
    </section>
</asp:Content>