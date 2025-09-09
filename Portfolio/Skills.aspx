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

        <!-- Online Judge Summary Section -->
        <section class="cp-section" aria-labelledby="judge-summary-title">
            <header class="cp-header">
                <h2 id="judge-summary-title">Online Judge Profile Summary</h2>
                <p>My journey across different competitive programming platforms</p>
            </header>
            
            <div class="judge-grid" role="list">
                <article class="judge-card" data-judge="codeforces" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fas fa-code"></i>
                        </div>
                        <a href="https://codeforces.com/profile/rifatalmuin" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit Codeforces profile">Codeforces</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="850" aria-label="850 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">Specialist (1400+)</div>
                    </div>
                </article>

                <article class="judge-card" data-judge="codechef" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <a href="https://www.codechef.com/users/rifat_246" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit CodeChef profile">CodeChef</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="120" aria-label="120 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">3 Star (1600+)</div>
                    </div>
                </article>

                <article class="judge-card" data-judge="vjudge" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fas fa-gavel"></i>
                        </div>
                        <a href="https://vjudge.net/user/rifat_al_muin" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit VJudge profile">VJudge</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="350" aria-label="350 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">Multi-Platform</div>
                    </div>
                </article>

                <article class="judge-card" data-judge="hackerrank" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fab fa-hackerrank"></i>
                        </div>
                        <a href="https://www.hackerrank.com/Rifatalmuin" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit HackerRank profile">HackerRank</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="95" aria-label="95 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">5 Star Gold</div>
                    </div>
                </article>

                <article class="judge-card" data-judge="atcoder" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fas fa-atom"></i>
                        </div>
                        <a href="https://atcoder.jp/users/rifatalmuin" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit AtCoder profile">AtCoder</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="75" aria-label="75 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">Brown (400+)</div>
                    </div>
                </article>

                <article class="judge-card" data-judge="toph" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fas fa-trophy"></i>
                        </div>
                        <a href="https://toph.co/u/rifat_246" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit Toph profile">Toph</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="80" aria-label="80 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">Bangladesh Platform</div>
                    </div>
                </article>

                <article class="judge-card" data-judge="spoj" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fas fa-terminal"></i>
                        </div>
                        <a href="https://www.spoj.com/users/rifatalmuin" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit SPOJ profile">SPOJ</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="45" aria-label="45 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">Classical Problems</div>
                    </div>
                </article>

                <article class="judge-card" data-judge="leetcode" role="listitem">
                    <header class="judge-header">
                        <div class="judge-logo" aria-hidden="true">
                            <i class="fas fa-code-branch"></i>
                        </div>
                        <a href="https://leetcode.com/rifat_246" target="_blank" rel="noopener noreferrer" class="judge-name" aria-label="Visit LeetCode profile">LeetCode</a>
                    </header>
                    <div class="judge-stats">
                        <div class="problem-count" data-count="65" aria-label="65 problems solved">0</div>
                        <div class="problem-label">Problems Solved</div>
                        <div class="judge-rating">Interview Prep</div>
                    </div>
                </article>
            </div>
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

    <!-- Load JavaScript for enhanced interactivity -->
    <script src="scripts/skills.js" defer></script>
</asp:Content>