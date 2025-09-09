// Enhanced Skills page JavaScript with scroll-triggered animations
document.addEventListener('DOMContentLoaded', function () {
    console.log('Skills page initialized');

    // Initialize skill progress bars with scroll trigger
    initializeSkillBarsOnScroll();

    // Initialize problem counters with scroll trigger
    initializeProblemCountersOnScroll();

    // Add hover effects for interactive elements
    addHoverEffects();

    // FUNCTIONS

    // Initialize skill progress bars with Intersection Observer
    function initializeSkillBarsOnScroll() {
        const skillCategories = document.querySelectorAll('.skill-category');

        const skillObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const progressBars = entry.target.querySelectorAll('.skill-progress');

                    progressBars.forEach((bar, index) => {
                        setTimeout(() => {
                            const width = bar.getAttribute('data-width');
                            if (width) {
                                bar.style.width = width;
                                console.log(`Animating skill bar to ${width}`);
                            }
                        }, index * 200); // Staggered animation
                    });

                    // Only animate once
                    skillObserver.unobserve(entry.target);
                }
            });
        }, {
            threshold: 0.2, // Trigger when 20% of element is visible
            rootMargin: '0px 0px -50px 0px' // Trigger slightly before reaching viewport
        });

        skillCategories.forEach(category => {
            skillObserver.observe(category);
        });
    }

    // Initialize problem counters with scroll trigger
    function initializeProblemCountersOnScroll() {
        const judgeCards = document.querySelectorAll('.judge-card');

        const counterObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const problemCount = entry.target.querySelector('.problem-count');
                    if (problemCount && problemCount.getAttribute('data-count')) {
                        const target = parseInt(problemCount.getAttribute('data-count'));

                        // Add staggered animation delay based on card index
                        const cards = document.querySelectorAll('.judge-card');
                        const index = Array.from(cards).indexOf(entry.target);

                        setTimeout(() => {
                            animateCounter(problemCount, target);
                            console.log(`Animating counter ${index} to ${target}`);
                        }, index * 150); // Staggered by 150ms each
                    }

                    // Only animate once
                    counterObserver.unobserve(entry.target);
                }
            });
        }, {
            threshold: 0.3, // Trigger when 30% of card is visible
            rootMargin: '0px 0px -20px 0px'
        });

        judgeCards.forEach(card => {
            counterObserver.observe(card);
        });
    }

    // Counter animation function
    function animateCounter(element, target, duration = 1500) {
        let start = 0;
        const increment = target / (duration / 16);

        function updateCounter() {
            start += increment;
            if (start < target) {
                element.textContent = Math.floor(start);
                requestAnimationFrame(updateCounter);
            } else {
                element.textContent = target;
                element.classList.add('counting');
            }
        }

        updateCounter();
    }

    // Add hover effects for interactive elements
    function addHoverEffects() {
        // Judge cards hover effects
        const judgeCards = document.querySelectorAll('.judge-card');
        judgeCards.forEach(card => {
            card.addEventListener('mouseenter', function () {
                const logo = this.querySelector('.judge-logo');
                const count = this.querySelector('.problem-count');
                const rating = this.querySelector('.judge-rating');

                if (logo) logo.style.transform = 'scale(1.15) rotate(15deg)';
                if (count) count.style.transform = 'scale(1.15)';
                if (rating) rating.style.transform = 'scale(1.1)';
            });

            card.addEventListener('mouseleave', function () {
                const logo = this.querySelector('.judge-logo');
                const count = this.querySelector('.problem-count');
                const rating = this.querySelector('.judge-rating');

                if (logo) logo.style.transform = 'scale(1) rotate(0deg)';
                if (count) count.style.transform = 'scale(1)';
                if (rating) rating.style.transform = 'scale(1)';
            });
        });

        // Contest rows hover effects
        const contestRows = document.querySelectorAll('.contest-row');
        contestRows.forEach(row => {
            row.addEventListener('mouseenter', function () {
                const rankBadge = this.querySelector('.rank-badge');
                const statusBadge = this.querySelector('.status-badge');

                if (rankBadge) rankBadge.style.transform = 'scale(1.1)';
                if (statusBadge) statusBadge.style.transform = 'scale(1.1)';
            });

            row.addEventListener('mouseleave', function () {
                const rankBadge = this.querySelector('.rank-badge');
                const statusBadge = this.querySelector('.status-badge');

                if (rankBadge) rankBadge.style.transform = 'scale(1)';
                if (statusBadge) statusBadge.style.transform = 'scale(1)';
            });
        });

        // Table container hover effects
        const tableContainers = document.querySelectorAll('.contest-table-container');
        tableContainers.forEach(container => {
            container.addEventListener('mouseenter', function () {
                this.style.transform = 'translateY(-3px)';
            });

            container.addEventListener('mouseleave', function () {
                this.style.transform = 'translateY(0)';
            });
        });
    }
});