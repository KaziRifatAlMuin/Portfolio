<%@ Page Title="Skills" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="Portfolio.Skills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles/skills.css" />
    <meta name="description" content="Technical skills, competitive programming expertise, and programming contest achievements of Kazi Rifat Al Muin" />
    <meta name="keywords" content="programming skills, competitive programming, algorithms, data structures, C++, Java, JavaScript" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-section" role="main" aria-labelledby="skills-title">
        <!-- Page Header -->
        <header class="section-header">
            <h1 id="skills-title">Technical Skills & Competitive Programming</h1>
            <p>My expertise in programming languages, algorithms, and competitive programming journey</p>
        </header>

        <!-- Technical Skills Section -->
        <section class="skills-section" aria-labelledby="technical-skills-title">
            <div class="skills-grid">
                <article class="skill-category" data-category="languages">
                    <header class="category-header">
                        <i class="fas fa-code" aria-hidden="true"></i>
                        <h3 id="technical-skills-title">Programming Languages</h3>
                    </header>
                    <div class="skill-list" role="list">
                        <!-- Dynamic content will be loaded here from database -->
                    </div>
                </article>

                <article class="skill-category" data-category="competitive">
                    <header class="category-header">
                        <i class="fas fa-trophy" aria-hidden="true"></i>
                        <h3>Competitive Programming</h3>
                    </header>
                    <div class="skill-list" role="list">
                        <!-- Dynamic content will be loaded here from database -->
                    </div>
                </article>

                <article class="skill-category" data-category="tools">
                    <header class="category-header">
                        <i class="fas fa-tools" aria-hidden="true"></i>
                        <h3>Tools & Technologies</h3>
                    </header>
                    <div class="skill-list" role="list">
                        <!-- Dynamic content will be loaded here from database -->
                    </div>
                </article>
            </div>
        </section>

        <!-- Online Judge Summary Section with Counting Animation -->
        <section class="cp-section" aria-labelledby="judge-summary-title">
            <header class="cp-header">
                <h2 id="judge-summary-title">Online Judge Profile Summary</h2>
                <p>My journey across different competitive programming platforms</p>
            </header>
            
            <!-- Dynamic Judge Grid with Counting Animation -->
            <div class="judge-grid" role="list" id="judgeGrid">
                <!-- Dynamic content will be loaded here from database with counting animation -->
            </div>

            <!-- No Judges Message Panel -->
            <asp:Panel ID="pnlNoJudges" runat="server" CssClass="no-judges-message" Visible="false">
                <div class="no-judges-container">
                    <i class="fas fa-code" aria-hidden="true"></i>
                    <h3>No Online Judge Entries Found</h3>
                    <p>There are currently no competitive programming platform entries to display.</p>
                    <p>Please check back later or contact the admin to add entries.</p>
                </div>
            </asp:Panel>
        </section>

        <!-- ICPC History Section -->
        <section class="contest-section" aria-labelledby="icpc-history-title">
            <header class="contest-header">
                <h2 id="icpc-history-title">ICPC History</h2>
                <p>International Collegiate Programming Contest journey</p>
            </header>
            
            <div class="contest-table-container">
                <table class="contest-table" role="table" aria-label="ICPC contest history">
                    <thead>
                        <tr role="row">
                            <th scope="col">Contest Title</th>
                            <th scope="col">Date</th>
                            <th scope="col">Rank</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dynamic content will be loaded here from database -->
                    </tbody>
                </table>
            </div>
        </section>

        <!-- IUPC History Section -->
        <section class="contest-section" aria-labelledby="iupc-history-title">
            <header class="contest-header">
                <h2 id="iupc-history-title">IUPC History</h2>
                <p>Inter University Programming Contest achievements</p>
            </header>
            
            <div class="contest-table-container">
                <table class="contest-table" role="table" aria-label="IUPC contest history">
                    <thead>
                        <tr role="row">
                            <th scope="col">Contest Title</th>
                            <th scope="col">Date</th>
                            <th scope="col">Rank</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dynamic content will be loaded here from database -->
                    </tbody>
                </table>
            </div>
        </section>
    </section>

    <!-- Load JavaScript for enhanced interactivity and dynamic content -->
    <script src="scripts/skills.js" defer></script>
</asp:Content>
