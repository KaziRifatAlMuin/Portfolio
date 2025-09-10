// Skills page JavaScript with dynamic online judge data loading

document.addEventListener('DOMContentLoaded', function () {
    // Initialize skill progress bars animation
    initializeSkillBars();

    // Initialize counter animations
    initializeCounters();

    // Load dynamic online judge data if available
    loadOnlineJudgeData();
});

function initializeSkillBars() {
    const skillBars = document.querySelectorAll('.skill-progress');

    // Intersection Observer for skill bars animation
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const progressBar = entry.target;
                const targetWidth = progressBar.getAttribute('data-width');

                setTimeout(() => {
                    progressBar.style.width = targetWidth;
                }, 300);

                observer.unobserve(progressBar);
            }
        });
    }, { threshold: 0.5 });

    skillBars.forEach(bar => observer.observe(bar));
}

function initializeCounters() {
    const counters = document.querySelectorAll('.problem-count');

    const counterObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const counter = entry.target;
                const target = parseInt(counter.getAttribute('data-count'));

                if (target > 0) {
                    animateCounter(counter, 0, target, 2000);
                    counter.classList.add('counting');
                }

                counterObserver.unobserve(counter);
            }
        });
    }, { threshold: 0.5 });

    counters.forEach(counter => counterObserver.observe(counter));
}

function animateCounter(element, start, end, duration) {
    const range = end - start;
    const increment = range / (duration / 16);
    let current = start;

    const timer = setInterval(() => {
        current += increment;
        if (current >= end) {
            current = end;
            clearInterval(timer);
        }
        element.textContent = Math.floor(current).toLocaleString();
    }, 16);
}

function loadOnlineJudgeData() {
    // Check if dynamic data is available
    if (typeof window.onlineJudgeData !== 'undefined' && window.onlineJudgeData.length > 0) {
        console.log('Loading online judge data:', window.onlineJudgeData);
        updateJudgeCards(window.onlineJudgeData);
    } else {
        console.log('No online judge data available');
        // Hide the judge grid if no data
        const judgeGrid = document.querySelector('.judge-grid');
        if (judgeGrid) {
            judgeGrid.style.display = 'none';
        }
    }
}

function updateJudgeCards(judgeData) {
    const judgeGrid = document.querySelector('.judge-grid');
    if (!judgeGrid) return;

    // Define coding-related logos (cycling through these)
    const logoIcons = [
        'fas fa-code',
        'fas fa-terminal',
        'fas fa-laptop-code',
        'fas fa-bug',
        'fas fa-cogs',
        'fas fa-rocket'
    ];

    // Clear existing static cards
    judgeGrid.innerHTML = '';
    judgeGrid.style.display = 'grid';

    // Create dynamic cards from database
    judgeData.forEach((judge, index) => {
        const logoIcon = logoIcons[index % logoIcons.length];

        const judgeCard = createJudgeCard(judge, logoIcon);
        judgeGrid.appendChild(judgeCard);
    });

    // Re-initialize counters for new cards
    setTimeout(() => {
        initializeCounters();
    }, 100);

    console.log(`Created ${judgeData.length} judge cards`);
}

function createJudgeCard(judge, logoIcon) {
    const card = document.createElement('article');
    card.className = 'judge-card';
    card.setAttribute('role', 'listitem');
    card.setAttribute('data-judge', judge.judgeName.toLowerCase().replace(/\s+/g, ''));

    // Generate rating text based on solve count
    const rating = generateRating(judge.solveCount);

    card.innerHTML = `
        <header class="judge-header">
            <div class="judge-logo" aria-hidden="true">
                <i class="${logoIcon}"></i>
            </div>
            <a href="${judge.profileLink}" target="_blank" rel="noopener noreferrer" 
               class="judge-name" aria-label="Visit ${judge.judgeName} profile">${judge.judgeName}</a>
        </header>
        <div class="judge-stats">
            <div class="problem-count" data-count="${judge.solveCount}" 
                 aria-label="${judge.solveCount} problems solved">0</div>
            <div class="problem-label">Problems Solved</div>
            <div class="judge-rating">${rating}</div>
        </div>
    `;

    return card;
}

function generateRating(solveCount) {
    if (solveCount >= 1000) return 'Expert Level';
    if (solveCount >= 500) return 'Advanced';
    if (solveCount >= 200) return 'Intermediate';
    if (solveCount >= 50) return 'Beginner+';
    return 'Beginner';
}

// Add smooth scrolling for internal links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Enhanced accessibility - keyboard navigation for cards
document.addEventListener('keydown', function (e) {
    if (e.key === 'Enter' || e.key === ' ') {
        const focused = document.activeElement;
        if (focused.classList.contains('judge-card')) {
            const link = focused.querySelector('.judge-name');
            if (link) {
                link.click();
            }
        }
    }
});

// Add tabindex for keyboard navigation
document.addEventListener('DOMContentLoaded', function () {
    setTimeout(() => {
        document.querySelectorAll('.judge-card').forEach(card => {
            card.setAttribute('tabindex', '0');
        });
    }, 500);
});

console.log('Skills page JavaScript loaded successfully with dynamic online judge support');