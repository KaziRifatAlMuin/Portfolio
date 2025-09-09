// Home page specific JavaScript for interactive elements

// Enhanced Counter animation for stats section with multiple directions
function animateCounter(element, target, startValue = 0, direction = 'up', prefix = '', suffix = '') {
    let current = startValue;
    const duration = 2000; // 2 seconds animation duration
    const steps = 60; // Number of animation steps
    const stepTime = duration / steps;

    let increment;
    if (direction === 'down') {
        increment = (startValue - target) / steps;
    } else {
        increment = (target - startValue) / steps;
    }

    element.textContent = prefix + startValue + suffix;

    const timer = setInterval(() => {
        if (direction === 'down') {
            current -= increment;
            if (current <= target) {
                current = target;
                clearInterval(timer);
                // Add final glow effect on completion
                element.style.textShadow = '0 0 20px rgba(0, 255, 255, 0.8)';
                setTimeout(() => {
                    element.style.textShadow = '0 0 15px rgba(0, 255, 255, 0.3)';
                }, 500);
            }
        } else {
            current += increment;
            if (current >= target) {
                current = target;
                clearInterval(timer);
                // Add final glow effect on completion
                element.style.textShadow = '0 0 20px rgba(0, 255, 255, 0.8)';
                setTimeout(() => {
                    element.style.textShadow = '0 0 15px rgba(0, 255, 255, 0.3)';
                }, 500);
            }
        }

        // Update display with proper formatting
        const displayValue = Math.floor(current);
        if (direction === 'down') {
            element.textContent = prefix + displayValue + suffix;
        } else {
            if (target >= 1000) {
                element.textContent = displayValue + '+';
            } else {
                element.textContent = displayValue + suffix;
            }
        }
    }, stepTime);
}

// Observe stats section for counter animation trigger
const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const statNumbers = entry.target.querySelectorAll('.stat-number[data-count]');
            statNumbers.forEach((stat, index) => {
                const target = parseInt(stat.getAttribute('data-count'));
                const startValue = parseInt(stat.getAttribute('data-start')) || 0;
                const direction = stat.getAttribute('data-direction') || 'up';

                stat.classList.add('counting');

                // Stagger the animations for visual effect
                setTimeout(() => {
                    if (direction === 'down') {
                        animateCounter(stat, target, startValue, 'down', 'Top ', '');
                    } else {
                        animateCounter(stat, target, startValue, 'up', '', '');
                    }
                }, index * 200);
            });

            // Only run animation once
            statsObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.3 });

// Initialize stats observer for home page
const statsSection = document.querySelector('.stats');
if (statsSection) {
    statsObserver.observe(statsSection);
}

// Floating animation enhancement for profile image
const profileImage = document.querySelector('.profile-image');
if (profileImage) {
    profileImage.addEventListener('mouseenter', () => {
        profileImage.style.animationPlayState = 'paused';
        profileImage.style.transform = 'translateY(-10px) scale(1.08) rotateY(10deg)';
        profileImage.style.boxShadow = '0 0 100px rgba(0, 255, 255, 0.5)';
    });

    profileImage.addEventListener('mouseleave', () => {
        profileImage.style.animationPlayState = 'running';
        profileImage.style.transform = '';
        profileImage.style.boxShadow = '0 0 50px rgba(0, 255, 255, 0.1)';
    });
}

// Dynamic typing effect for hero title
const heroName = document.querySelector('.hero-title .name');
if (heroName) {
    const text = heroName.textContent;
    heroName.textContent = '';
    heroName.style.opacity = '1';

    let i = 0;
    function typeWriter() {
        if (i < text.length) {
            heroName.textContent += text.charAt(i);
            i++;
            setTimeout(typeWriter, 100);
        }
    }

    // Start typing effect after initial delay
    setTimeout(typeWriter, 1500);
}

// Enhanced social links hover effects
const socialLinks = document.querySelectorAll('.social-link');
socialLinks.forEach(link => {
    link.addEventListener('mouseenter', function () {
        this.style.transform = 'translateY(-8px) scale(1.15) rotate(5deg)';
        this.style.boxShadow = '0 12px 30px rgba(0, 255, 255, 0.3)';
    });

    link.addEventListener('mouseleave', function () {
        this.style.transform = 'translateY(-5px) scale(1.1)';
        this.style.boxShadow = '0 8px 25px rgba(0, 255, 255, 0.2)';
    });
});

// Hero buttons enhanced interaction
const heroButtons = document.querySelectorAll('.hero-buttons .btn');
heroButtons.forEach(button => {
    button.addEventListener('mouseenter', function () {
        this.style.transform = 'translateY(-5px) scale(1.05)';
        this.style.boxShadow = '0 15px 35px rgba(0, 255, 255, 0.3)';
    });

    button.addEventListener('mouseleave', function () {
        this.style.transform = 'translateY(-3px)';
        this.style.boxShadow = '0 8px 25px rgba(0, 255, 255, 0.2)';
    });
});

// Overview cards staggered animation on scroll
const overviewCards = document.querySelectorAll('.overview-card');
const overviewObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry, index) => {
        if (entry.isIntersecting) {
            setTimeout(() => {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0) scale(1)';
                entry.target.classList.add('animate-in');
            }, index * 150);
        }
    });
}, { threshold: 0.2 });

// Initialize overview cards animation
overviewCards.forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(40px) scale(0.9)';
    card.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
    overviewObserver.observe(card);
});