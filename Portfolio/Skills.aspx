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
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">C/C++</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="90%" aria-label="C/C++ proficiency: 90%"></div>
                            </div>
                        </div>
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">Java</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="75%" aria-label="Java proficiency: 75%"></div>
                            </div>
                        </div>
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">JavaScript</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="65%" aria-label="JavaScript proficiency: 65%"></div>
                            </div>
                        </div>
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">C#</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="60%" aria-label="C# proficiency: 60%"></div>
                            </div>
                        </div>
                    </div>
                </article>

                <article class="skill-category" data-category="competitive">
                    <header class="category-header">
                        <i class="fas fa-trophy" aria-hidden="true"></i>
                        <h3>Competitive Programming</h3>
                    </header>
                    <div class="skill-list" role="list">
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">Data Structures</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="95%" aria-label="Data Structures proficiency: 95%"></div>
                            </div>
                        </div>
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">Algorithms</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="90%" aria-label="Algorithms proficiency: 90%"></div>
                            </div>
                        </div>
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">Problem Solving</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="85%" aria-label="Problem Solving proficiency: 85%"></div>
                            </div>
                        </div>
                    </div>
                </article>

                <article class="skill-category" data-category="tools">
                    <header class="category-header">
                        <i class="fas fa-tools" aria-hidden="true"></i>
                        <h3>Tools & Technologies</h3>
                    </header>
                    <div class="skill-list" role="list">
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">Git & GitHub</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="80%" aria-label="Git & GitHub proficiency: 80%"></div>
                            </div>
                        </div>
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">Visual Studio</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="85%" aria-label="Visual Studio proficiency: 85%"></div>
                            </div>
                        </div>
                        <div class="skill-item" role="listitem">
                            <span class="skill-name">Android Studio</span>
                            <div class="skill-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
                                <div class="skill-progress" data-width="70%" aria-label="Android Studio proficiency: 70%"></div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </section>

        <!-- Online Judge Summary Section - Dynamic from Database -->
        <section class="cp-section" aria-labelledby="judge-summary-title">
            <header class="cp-header">
                <h2 id="judge-summary-title">Online Judge Profile Summary</h2>
                <p>My journey across different competitive programming platforms</p>
            </header>
            
            <!-- Dynamic Judge Grid - Will be populated by JavaScript -->
            <div class="judge-grid" role="list" id="judgeGrid">
                <!-- Dynamic content will be loaded here from database -->
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
                        <tr class="contest-row" data-rank="39" role="row">
                            <td>
                                <a href="https://icpc.global/regionals/finder/dhaka-2024" target="_blank" rel="noopener noreferrer" class="contest-link" aria-label="ICPC Asia Dhaka Regional 2024 details">
                                    ICPC Asia Dhaka Regional 2024
                                </a>
                            </td>
                            <td>November 15, 2024</td>
                            <td class="rank-cell">
                                <span class="rank-badge rank-excellent" aria-label="Rank: 39th place">39th</span>
                            </td>
                            <td>
                                <span class="status-badge status-qualified" aria-label="Status: Regional Qualified">Regional Qualified</span>
                            </td>
                        </tr>
                        <tr class="contest-row" data-rank="45" role="row">
                            <td>
                                <a href="https://icpc.global/regionals/finder/dhaka-2023" target="_blank" rel="noopener noreferrer" class="contest-link" aria-label="ICPC Asia Dhaka Regional 2023 details">
                                    ICPC Asia Dhaka Regional 2023
                                </a>
                            </td>
                            <td>December 8, 2023</td>
                            <td class="rank-cell">
                                <span class="rank-badge rank-good" aria-label="Rank: 45th place">45th</span>
                            </td>
                            <td>
                                <span class="status-badge status-participated" aria-label="Status: Participated">Participated</span>
                            </td>
                        </tr>
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
                        <tr class="contest-row" data-rank="26" role="row">
                            <td>
                                <a href="#" target="_blank" class="contest-link" aria-label="AUST Inter University Programming Contest 2025 details">
                                    AUST Inter University Programming Contest 2025
                                </a>
                            </td>
                            <td>January 20, 2025</td>
                            <td class="rank-cell">
                                <span class="rank-badge rank-excellent" aria-label="Rank: 26th place">26th</span>
                            </td>
                            <td>
                                <span class="status-badge status-winner" aria-label="Status: Top Performer">Top Performer</span>
                            </td>
                        </tr>
                        <tr class="contest-row" data-rank="29" role="row">
                            <td>
                                <a href="#" target="_blank" class="contest-link" aria-label="BUET Inter University Programming Contest 2024 details">
                                    BUET Inter University Programming Contest 2024
                                </a>
                            </td>
                            <td>November 25, 2024</td>
                            <td class="rank-cell">
                                <span class="rank-badge rank-excellent" aria-label="Rank: 29th place">29th</span>
                            </td>
                            <td>
                                <span class="status-badge status-winner" aria-label="Status: Top Performer">Top Performer</span>
                            </td>
                        </tr>
                        <tr class="contest-row" data-rank="42" role="row">
                            <td>
                                <a href="#" target="_blank" class="contest-link" aria-label="DIU Inter University Programming Contest 2024 details">
                                    DIU Inter University Programming Contest 2024
                                </a>
                            </td>
                            <td>October 15, 2024</td>
                            <td class="rank-cell">
                                <span class="rank-badge rank-good" aria-label="Rank: 42nd place">42nd</span>
                            </td>
                            <td>
                                <span class="status-badge status-qualified" aria-label="Status: Qualified">Qualified</span>
                            </td>
                        </tr>
                        <tr class="contest-row" data-rank="58" role="row">
                            <td>
                                <a href="#" target="_blank" class="contest-link" aria-label="UIU Inter University Programming Contest 2024 details">
                                    UIU Inter University Programming Contest 2024
                                </a>
                            </td>
                            <td>September 10, 2024</td>
                            <td class="rank-cell">
                                <span class="rank-badge rank-good" aria-label="Rank: 58th place">58th</span>
                            </td>
                            <td>
                                <span class="status-badge status-participated" aria-label="Status: Participated">Participated</span>
                            </td>
                        </tr>
                        <tr class="contest-row" data-rank="35" role="row">
                            <td>
                                <a href="#" target="_blank" class="contest-link" aria-label="NSU Inter University Programming Contest 2024 details">
                                    NSU Inter University Programming Contest 2024
                                </a>
                            </td>
                            <td>August 22, 2024</td>
                            <td class="rank-cell">
                                <span class="rank-badge rank-excellent" aria-label="Rank: 35th place">35th</span>
                            </td>
                            <td>
                                <span class="status-badge status-winner" aria-label="Status: Top Performer">Top Performer</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </section>

    <!-- Load JavaScript for enhanced interactivity and dynamic content -->
    <script src="scripts/skills.js" defer></script>

    <style>
        /* Additional styles for no judges message */
        .no-judges-container {
            text-align: center;
            padding: 4rem 2rem;
            background: linear-gradient(135deg, rgba(16, 7, 43, 0.8), rgba(14, 15, 43, 0.9));
            border: 1px solid rgba(0, 255, 255, 0.15);
            border-radius: 20px;
            color: #b8c5d6;
            max-width: 600px;
            margin: 0 auto;
        }

        .no-judges-container i {
            font-size: 4rem;
            color: #00ffff;
            margin-bottom: 1.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.5);
            display: block;
        }

        .no-judges-container h3 {
            color: #00ffff;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .no-judges-container p {
            margin-bottom: 0.5rem;
            line-height: 1.6;
        }

        /* Hide judge grid when no data */
        .judge-grid:empty {
            display: none;
        }

        /* Loading animation for judge cards */
        .judge-card {
            opacity: 0;
            transform: translateY(20px);
            animation: judgeCardFadeIn 0.5s ease-out forwards;
        }

        .judge-card:nth-child(1) { animation-delay: 0.1s; }
        .judge-card:nth-child(2) { animation-delay: 0.2s; }
        .judge-card:nth-child(3) { animation-delay: 0.3s; }
        .judge-card:nth-child(4) { animation-delay: 0.4s; }
        .judge-card:nth-child(5) { animation-delay: 0.5s; }
        .judge-card:nth-child(6) { animation-delay: 0.6s; }
        .judge-card:nth-child(7) { animation-delay: 0.7s; }
        .judge-card:nth-child(8) { animation-delay: 0.8s; }

        @keyframes judgeCardFadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive adjustments for no judges message */
        @media (max-width: 768px) {
            .no-judges-container {
                padding: 3rem 1.5rem;
            }

            .no-judges-container i {
                font-size: 3rem;
                margin-bottom: 1rem;
            }

            .no-judges-container h3 {
                font-size: 1.3rem;
            }
        }

        @media (max-width: 480px) {
            .no-judges-container {
                padding: 2rem 1rem;
            }

            .no-judges-container i {
                font-size: 2.5rem;
            }

            .no-judges-container h3 {
                font-size: 1.1rem;
            }
        }
    </style>
</asp:Content>