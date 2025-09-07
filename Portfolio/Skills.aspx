<%@ Page Title="Skills" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="Portfolio.Skills" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-section">
        <div class="section-header">
            <h1>Technical Skills</h1>
            <p>Technologies and tools I work with</p>
        </div>

        <div class="skills-grid">
            <div class="skill-category">
                <div class="category-header">
                    <i class="fas fa-code"></i>
                    <h3>Programming Languages</h3>
                </div>
                <div class="skill-list">
                    <div class="skill-item">
                        <span class="skill-name">C/C++</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="90%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">Java</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="75%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">JavaScript</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="65%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">C#</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="60%"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="skill-category">
                <div class="category-header">
                    <i class="fas fa-trophy"></i>
                    <h3>Competitive Programming</h3>
                </div>
                <div class="skill-list">
                    <div class="skill-item">
                        <span class="skill-name">Data Structures</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="95%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">Algorithms</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="90%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">Problem Solving</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="85%"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="skill-category">
                <div class="category-header">
                    <i class="fas fa-tools"></i>
                    <h3>Tools & Technologies</h3>
                </div>
                <div class="skill-list">
                    <div class="skill-item">
                        <span class="skill-name">Git & GitHub</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="80%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">Visual Studio</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="85%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">Android Studio</span>
                        <div class="skill-bar">
                            <div class="skill-progress" data-width="70%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>