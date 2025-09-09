<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Portfolio.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles/about.css" />
</asp:Content>

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

        <!-- Achievements Section -->
        <div class="achievements-section">
            <div class="achievements-header">
                <h2>My Achievements</h2>
                <p>Milestones in my competitive programming and academic journey</p>
            </div>
            
            <div class="achievements-container">
                <!-- Programming Achievements -->
                <div class="achievement-category">
                    <div class="category-icon">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <h3>Competitive Programming</h3>
                    <div class="achievement-items">
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>Specialist Rating</h4>
                                <p>Achieved Specialist rating on Codeforces platform</p>
                                <span class="achievement-platform">Codeforces</span>
                            </div>
                        </div>
                        
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-medal"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>26th Position</h4>
                                <p>AUST Inter University Programming Contest 2025</p>
                                <span class="achievement-platform">IUPC 2025</span>
                            </div>
                        </div>
                        
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-award"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>29th Position</h4>
                                <p>BUET Inter University Programming Contest 2024</p>
                                <span class="achievement-platform">IUPC 2024</span>
                            </div>
                        </div>
                        
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-gem"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>39th Position</h4>
                                <p>ICPC Dhaka Regional Contest 2024</p>
                                <span class="achievement-platform">ICPC Regional</span>
                            </div>
                        </div>
                        
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-fire"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>1500+ Problems Solved</h4>
                                <p>Across various online programming platforms</p>
                                <span class="achievement-platform">Multiple Platforms</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Academic & Leadership Achievements -->
                <div class="achievement-category">
                    <div class="category-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3>Academic & Leadership</h3>
                    <div class="achievement-items">
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>AGS of SGIPC</h4>
                                <p>Assistant General Secretary of our Programming Club</p>
                                <span class="achievement-platform">KUET</span>
                            </div>
                        </div>
                        
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-certificate"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>GPA 5.00</h4>
                                <p>Higher Secondary Certificate with Board Scholarship</p>
                                <span class="achievement-platform">HSC 2021</span>
                            </div>
                        </div>
                        
                        <div class="achievement-item">
                            <div class="achievement-badge">
                                <i class="fas fa-laptop-code"></i>
                            </div>
                            <div class="achievement-content">
                                <h4>CSE Student</h4>
                                <p>Currently pursuing Bachelor's in Computer Science</p>
                                <span class="achievement-platform">KUET</span>
                            </div>
                        </div>
                    </div>
                </div>
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

    <script src="scripts/about.js"></script>
</asp:Content>