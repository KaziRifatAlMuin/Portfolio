<%@ Page Title="Education" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Education.aspx.cs" Inherits="Portfolio.Education" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-section">
        <div class="section-header">
            <h1>Education</h1>
            <p>My academic journey and achievements</p>
        </div>

        <div class="education-timeline">
            <div class="timeline-item">
                <div class="timeline-marker">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-period">2023 - Present</div>
                    <h3>Bachelor of Science in Computer Science and Engineering</h3>
                    <h4>Khulna University of Engineering & Technology (KUET)</h4>
                    <p>Currently pursuing CSE degree with focus on algorithms, data structures, and software development. Active in competitive programming and various tech communities.</p>
                    <div class="achievements">
                        <span class="achievement">Competetive Programming</span>
                        <span class="achievement">AGS of SGIPC, Our Programming Club</span>
                    </div>
                </div>
            </div>

            <div class="timeline-item">
                <div class="timeline-marker">
                    <i class="fas fa-school"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-period">2019 - 2021</div>
                    <h3>Higher Secondary Certificate (HSC)</h3>
                    <h4>Govt. M. M. City College, Khulna</h4>
                    <p>Completed HSC in Science group with excellent result GPA 5.00 and Board Scholarship.</p>
                    <div class="achievements">
                        <span class="achievement">Science Group</span>
                        <span class="achievement">GPA 5.00</span>
                    </div>
                </div>
            </div>

            <div class="timeline-item">
                <div class="timeline-marker">
                    <i class="fas fa-award"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-period">Achievements</div>
                    <h3>Competitive Programming Achievements</h3>
                    <ul class="achievement-list">
                        <li>Specialist rating on Codeforces</li>
                        <li>26th in AUST Inter University Programming Contest 2025</li>
                        <li>29th in BUET Inter University Programming Contest 2024</li>
                        <li>39th in ICPC Dhaka Regional 2024</li>
                        <li>1500+ problems solved across various platforms</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</asp:Content>