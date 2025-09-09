// Main JavaScript file for site-wide functionality

// Navigation functionality
document.addEventListener('DOMContentLoaded', function () {
    // Get navigation elements
    const menuToggle = document.getElementById('menuToggle');
    const sideNav = document.getElementById('sideNav');
    const closeBtn = document.getElementById('closeBtn');
    const navOverlay = document.getElementById('navOverlay');
    const body = document.body;

    // Check if elements exist before adding event listeners
    if (!menuToggle || !sideNav || !closeBtn || !navOverlay) {
        console.error('Navigation elements not found');
        return;
    }

    // Toggle side navigation
    function toggleSideNav() {
        const isActive = sideNav.classList.contains('active');

        if (isActive) {
            closeSideNav();
        } else {
            openSideNav();
        }
    }

    // Open side navigation
    function openSideNav() {
        sideNav.classList.add('active');
        navOverlay.classList.add('active');
        menuToggle.classList.add('active');
        body.style.overflow = 'hidden'; // Prevent scrolling when nav is open

        // Add margin to body on desktop (above 1024px)
        if (window.innerWidth > 1024) {
            body.classList.add('nav-open');
        }
    }

    // Close side navigation
    function closeSideNav() {
        sideNav.classList.remove('active');
        navOverlay.classList.remove('active');
        menuToggle.classList.remove('active');
        body.classList.remove('nav-open');
        body.style.overflow = ''; // Restore scrolling
    }

    // Event listeners
    menuToggle.addEventListener('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
        toggleSideNav();
    });

    closeBtn.addEventListener('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
        closeSideNav();
    });

    navOverlay.addEventListener('click', function (e) {
        e.preventDefault();
        closeSideNav();
    });

    // Close nav when pressing Escape key
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape' && sideNav.classList.contains('active')) {
            closeSideNav();
        }
    });

    // Handle window resize
    window.addEventListener('resize', function () {
        if (window.innerWidth > 1024) {
            navOverlay.classList.remove('active');
            // Keep side nav functionality for desktop
        } else {
            body.classList.remove('nav-open');
            // Close side nav if window becomes smaller
            if (window.innerWidth <= 768 && sideNav.classList.contains('active')) {
                closeSideNav();
            }
        }
    });

    // Set active navigation link for both top and side navigation
    const currentPage = window.location.pathname.split('/').pop() || 'Home.aspx';

    // Side navigation
    const sideNavLinks = document.querySelectorAll('.nav-menu a');
    sideNavLinks.forEach(link => {
        const href = link.getAttribute('href');
        if (href === currentPage ||
            (currentPage === '' && href === 'Home.aspx') ||
            (currentPage === 'Default.aspx' && href === 'Home.aspx')) {
            link.classList.add('active');
        }

        // Close nav when clicking on nav links (mobile)
        link.addEventListener('click', function () {
            if (window.innerWidth <= 1024) {
                setTimeout(closeSideNav, 200); // Small delay for smooth transition
            }
        });
    });

    // Top navigation
    const topNavLinks = document.querySelectorAll('.top-navbar .nav-links a');
    topNavLinks.forEach(link => {
        const href = link.getAttribute('href');
        if (href === currentPage ||
            (currentPage === '' && href === 'Home.aspx') ||
            (currentPage === 'Default.aspx' && href === 'Home.aspx')) {
            link.classList.add('active');
        }
    });
});

// Smooth scrolling for navigation links across all pages
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            const offset = window.innerWidth > 1024 ? 100 : 70; // Account for navigation height
            const elementPosition = target.getBoundingClientRect().top;
            const offsetPosition = elementPosition + window.pageYOffset - offset;

            window.scrollTo({
                top: offsetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// Enhanced navbar scroll effect for top navigation
window.addEventListener('scroll', () => {
    const topNavbar = document.querySelector('.top-navbar');
    if (topNavbar) {
        if (window.scrollY > 50) {
            topNavbar.style.background = 'rgba(14, 15, 43, 0.98)';
            topNavbar.style.boxShadow = '0 4px 30px rgba(0, 0, 0, 0.4)';
        } else {
            topNavbar.style.background = 'rgba(14, 15, 43, 0.95)';
            topNavbar.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.3)';
        }
    }
});

// Advanced element animation observer for scroll-triggered animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -30px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';

            // Special animation for skill categories
            if (entry.target.classList.contains('skill-category')) {
                animateSkillBars(entry.target);
                entry.target.style.transform = 'translateY(0) scale(1)';
            }

            // Stagger animation for cards
            if (entry.target.classList.contains('overview-card') ||
                entry.target.classList.contains('project-card') ||
                entry.target.classList.contains('info-card')) {
                const cards = document.querySelectorAll('.overview-card, .project-card, .info-card');
                const index = Array.from(cards).indexOf(entry.target);
                entry.target.style.animationDelay = `${index * 0.1}s`;
                entry.target.classList.add('animate-in');
            }
        }
    });
}, observerOptions);

// Observe all animated elements across the site
document.querySelectorAll('.overview-card, .about-card, .skill-category, .project-card, .timeline-item, .stat-item, .info-card').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
    el.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
    observer.observe(el);
});

// Enhanced skill bar animation with glow effects
function animateSkillBars(container) {
    const skillBars = container.querySelectorAll('.skill-progress');
    skillBars.forEach((bar, index) => {
        setTimeout(() => {
            const width = bar.getAttribute('data-width');
            if (width) {
                bar.style.width = width;

                // Add pulsing glow effect after animation
                setTimeout(() => {
                    bar.style.boxShadow = '0 0 15px rgba(0, 255, 255, 0.5)';
                    setTimeout(() => {
                        bar.style.boxShadow = '0 0 10px rgba(0, 255, 255, 0.3)';
                    }, 300);
                }, 1000);
            }
        }, index * 200);
    });
}

// Enhanced hover effects with optimized 3D transforms
document.querySelectorAll('.overview-card, .about-card, .project-card, .info-card').forEach(card => {
    card.addEventListener('mouseenter', function () {
        if (window.innerWidth > 768) {
            this.style.transform = 'translateY(-8px) scale(1.02)';
        } else {
            this.style.transform = 'translateY(-4px) scale(1.01)';
        }
        this.style.transition = 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)';
    });

    card.addEventListener('mouseleave', function () {
        this.style.transform = 'translateY(0) scale(1)';
    });
});

// Enhanced contact form interactions for better user experience
const contactForm = document.querySelector('.contact-form');
if (contactForm) {
    const inputs = contactForm.querySelectorAll('.form-input, .form-textarea');

    inputs.forEach(input => {
        // Focus effects for form inputs
        input.addEventListener('focus', function () {
            this.style.borderColor = 'rgba(0, 255, 255, 0.6)';
            this.style.background = 'rgba(0, 255, 255, 0.1)';
            this.style.transform = 'translateY(-1px)';
        });

        // Blur effects when losing focus
        input.addEventListener('blur', function () {
            this.style.borderColor = 'rgba(0, 255, 255, 0.2)';
            this.style.background = 'rgba(0, 255, 255, 0.05)';
            this.style.transform = 'translateY(0)';
        });
    });
}

// Add CSS for additional animations via JavaScript
const additionalStyles = `
    .animate-in {
        animation: slideInUp 0.6s cubic-bezier(0.4, 0, 0.2, 1) forwards;
    }
    
    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(30px) scale(0.98);
        }
        to {
            opacity: 1;
            transform: translateY(0) scale(1);
        }
    }
    
    .skill-category {
        perspective: 1000px;
    }
    
    .timeline-content:hover {
        perspective: 1000px;
        transform: translateX(8px) rotateY(3deg);
    }
    
    @media (max-width: 768px) {
        .timeline-content:hover {
            transform: translateX(5px);
        }
    }
`;

// Inject additional styles into the document head
const styleSheet = document.createElement('style');
styleSheet.textContent = additionalStyles;
document.head.appendChild(styleSheet);

// Optimize animations for mobile devices
const isMobile = window.innerWidth <= 768;
if (isMobile) {
    // Reduce animation complexity on mobile
    document.querySelectorAll('.overview-card, .project-card, .skill-category, .stat-item').forEach(el => {
        el.style.transition = 'all 0.3s ease';
    });
}

// Performance optimization: Reduce animations on low-end devices
const isLowEndDevice = navigator.hardwareConcurrency && navigator.hardwareConcurrency <= 2;
if (isLowEndDevice) {
    document.documentElement.style.setProperty('--animation-duration', '0.2s');
}

// Error handling for missing elements
window.addEventListener('error', function (e) {
    console.error('JavaScript error:', e.error);
});

// Debug information
console.log('Navigation system initialized successfully');