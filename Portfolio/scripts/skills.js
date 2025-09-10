// ===== SKILLS PAGE INTERACTIVE FUNCTIONALITY =====
// Enhanced with counting animation for online judges

document.addEventListener('DOMContentLoaded', function () {
    initializeSkillsPage();
});

function initializeSkillsPage() {
    // Initialize all components
    setupIntersectionObserver();
    setupSkillBarAnimations();
    setupJudgeCardAnimations();
    setupTableAnimations();
    setupAccessibilityFeatures();

    console.log('Skills page initialized successfully with counting animation');
}

// ===== INTERSECTION OBSERVER FOR SCROLL ANIMATIONS =====
function setupIntersectionObserver() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');

                // Trigger specific animations based on element type
                if (entry.target.classList.contains('skill-category')) {
                    animateSkillBars(entry.target);
                } else if (entry.target.classList.contains('judge-grid') || entry.target.id === 'judgeGrid') {
                    setTimeout(() => {
                        initializeCounters();
                    }, 500);
                } else if (entry.target.classList.contains('contest-table')) {
                    animateTableRows(entry.target);
                }
            }
        });
    }, observerOptions);

    // Observe skill categories
    document.querySelectorAll('.skill-category').forEach(category => {
        observer.observe(category);
    });

    // Observe judge grid
    const judgeGrid = document.getElementById('judgeGrid');
    if (judgeGrid) {
        observer.observe(judgeGrid);
    }

    // Observe contest tables
    document.querySelectorAll('.contest-table').forEach(table => {
        observer.observe(table);
    });
}

// ===== COUNTING ANIMATION FOR ONLINE JUDGES =====
function initializeCounters() {
    const counters = document.querySelectorAll('.problem-count');

    if (counters.length === 0) {
        console.log('No counters found to animate');
        return;
    }

    const counterObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const counter = entry.target;
                const target = parseInt(counter.getAttribute('data-count'));

                if (target > 0 && !counter.classList.contains('counted')) {
                    counter.classList.add('counted');
                    animateCounter(counter, 0, target, 2000);
                    console.log(`Animating counter to ${target}`);
                }

                counterObserver.unobserve(counter);
            }
        });
    }, { threshold: 0.3 });

    counters.forEach(counter => {
        counterObserver.observe(counter);
    });
}

function animateCounter(element, start, end, duration) {
    const range = end - start;
    const increment = Math.max(range / (duration / 16), 1);
    let current = start;

    // Add cyan glow effect during counting
    element.style.color = '#00ffff';
    element.style.textShadow = '0 0 10px rgba(0, 255, 255, 0.5)';
    element.style.transition = 'all 0.3s ease';

    const timer = setInterval(() => {
        current += increment;
        if (current >= end) {
            current = end;
            clearInterval(timer);
            // Add final glow effect
            element.style.textShadow = '0 0 20px rgba(0, 255, 255, 0.8)';
        }

        // Format number with commas for large numbers
        element.textContent = Math.floor(current).toLocaleString();
    }, 16);
}

// ===== SKILL BAR ANIMATIONS =====
function setupSkillBarAnimations() {
    // This will be called when skill bars are dynamically loaded
    window.animateSkillBarsInCategory = function (categoryElement) {
        const skillBars = categoryElement.querySelectorAll('.skill-progress');

        skillBars.forEach((bar, index) => {
            setTimeout(() => {
                const width = bar.getAttribute('data-width');
                if (width) {
                    bar.style.width = width;
                    bar.style.opacity = '1';
                }
            }, index * 200);
        });
    };
}

function animateSkillBars(categoryElement) {
    const skillBars = categoryElement.querySelectorAll('.skill-progress');

    skillBars.forEach((bar, index) => {
        setTimeout(() => {
            const width = bar.getAttribute('data-width');
            if (width) {
                bar.style.width = width;

                // Add pulse effect for high percentages
                const percentage = parseInt(width);
                if (percentage >= 80) {
                    bar.classList.add('high-skill');
                }
            }
        }, index * 300);
    });
}

// ===== JUDGE CARD ANIMATIONS =====
function setupJudgeCardAnimations() {
    // Add hover effects and interaction handlers
    document.addEventListener('mouseover', function (e) {
        if (e.target.closest('.judge-card')) {
            const card = e.target.closest('.judge-card');
            addJudgeCardEffects(card);
        }
    });
}

function addJudgeCardEffects(card) {
    // Add ripple effect on hover
    if (!card.querySelector('.ripple-effect')) {
        const ripple = document.createElement('div');
        ripple.className = 'ripple-effect';
        card.style.position = 'relative';
        card.appendChild(ripple);

        setTimeout(() => {
            ripple.remove();
        }, 1000);
    }
}

// ===== TABLE ANIMATIONS =====
function animateTableRows(table) {
    const rows = table.querySelectorAll('tbody tr');

    rows.forEach((row, index) => {
        setTimeout(() => {
            row.style.opacity = '1';
            row.style.transform = 'translateX(0)';
        }, index * 100);
    });
}

function setupTableAnimations() {
    // Add sorting capabilities
    document.querySelectorAll('.contest-table th').forEach(header => {
        header.style.cursor = 'pointer';
        header.addEventListener('click', function () {
            sortTable(this);
        });
    });
}

function sortTable(header) {
    const table = header.closest('table');
    const tbody = table.querySelector('tbody');
    const rows = Array.from(tbody.querySelectorAll('tr'));
    const columnIndex = Array.from(header.parentNode.children).indexOf(header);

    // Determine sort direction
    const isAscending = header.getAttribute('data-sort') !== 'asc';
    header.setAttribute('data-sort', isAscending ? 'asc' : 'desc');

    // Sort rows
    rows.sort((a, b) => {
        const aValue = a.children[columnIndex].textContent.trim();
        const bValue = b.children[columnIndex].textContent.trim();

        // Handle different data types
        if (columnIndex === 1) { // Date column
            return isAscending ?
                new Date(aValue) - new Date(bValue) :
                new Date(bValue) - new Date(aValue);
        } else if (columnIndex === 2) { // Rank column
            const aRank = parseInt(aValue);
            const bRank = parseInt(bValue);
            return isAscending ? aRank - bRank : bRank - aRank;
        } else { // Text columns
            return isAscending ?
                aValue.localeCompare(bValue) :
                bValue.localeCompare(aValue);
        }
    });

    // Re-append sorted rows
    rows.forEach(row => tbody.appendChild(row));

    // Add visual indicator
    updateSortIndicators(header, isAscending);
}

function updateSortIndicators(activeHeader, isAscending) {
    // Remove all sort indicators
    document.querySelectorAll('.contest-table th').forEach(header => {
        header.classList.remove('sort-asc', 'sort-desc');
    });

    // Add indicator to active header
    activeHeader.classList.add(isAscending ? 'sort-asc' : 'sort-desc');
}

// ===== ACCESSIBILITY FEATURES =====
function setupAccessibilityFeatures() {
    // Add keyboard navigation
    setupKeyboardNavigation();

    // Add screen reader announcements
    setupScreenReaderAnnouncements();

    // Add high contrast mode detection
    setupHighContrastMode();
}

function setupKeyboardNavigation() {
    // Allow keyboard navigation for judge cards
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Enter' || e.key === ' ') {
            const focused = document.activeElement;
            if (focused.classList.contains('judge-name')) {
                e.preventDefault();
                focused.click();
            }
        }
    });
}

function setupScreenReaderAnnouncements() {
    // Announce when counting animations complete
    window.announceCountComplete = function (judgeName, count) {
        const announcement = document.createElement('div');
        announcement.setAttribute('aria-live', 'polite');
        announcement.setAttribute('aria-atomic', 'true');
        announcement.style.position = 'absolute';
        announcement.style.left = '-10000px';
        announcement.textContent = `${judgeName}: ${count} problems solved`;
        document.body.appendChild(announcement);

        setTimeout(() => {
            document.body.removeChild(announcement);
        }, 1000);
    };
}

function setupHighContrastMode() {
    // Detect high contrast mode preference
    if (window.matchMedia('(prefers-contrast: high)').matches) {
        document.body.classList.add('high-contrast-mode');
    }

    // Listen for changes
    window.matchMedia('(prefers-contrast: high)').addEventListener('change', (e) => {
        if (e.matches) {
            document.body.classList.add('high-contrast-mode');
        } else {
            document.body.classList.remove('high-contrast-mode');
        }
    });
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
    }, 1000);
});

console.log('Skills page JavaScript loaded successfully with counting animation for online judges');