// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({ behavior: 'smooth' });
        }
    });
});

// Enhanced navbar scroll effect
window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        navbar.style.background = 'rgba(16, 7, 43, 0.95)';
        navbar.style.boxShadow = '0 8px 32px rgba(0, 0, 0, 0.4)';
    } else {
        navbar.style.background = 'rgba(14, 15, 43, 0.85)';
        navbar.style.boxShadow = '0 4px 20px rgba(0, 0, 0, 0.3)';
    }
});

// Advanced element animation observer
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
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
            if (entry.target.classList.contains('overview-card')) {
                const cards = document.querySelectorAll('.overview-card');
                const index = Array.from(cards).indexOf(entry.target);
                entry.target.style.animationDelay = `${index * 0.2}s`;
                entry.target.classList.add('animate-in');
            }
        }
    });
}, observerOptions);

// Observe all animated elements
document.querySelectorAll('.overview-card, .about-card, .skill-category, .project-card, .timeline-item, .stat-item').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(30px)';
    el.style.transition = 'all 0.8s cubic-bezier(0.4, 0, 0.2, 1)';
    observer.observe(el);
});

// Enhanced skill bar animation with glow effects
function animateSkillBars(container) {
    const skillBars = container.querySelectorAll('.skill-progress');
    skillBars.forEach((bar, index) => {
        setTimeout(() => {
            const width = bar.getAttribute('data-width');
            bar.style.width = width;

            // Add pulsing glow effect
            setTimeout(() => {
                bar.style.boxShadow = '0 0 20px rgba(0, 255, 255, 0.6)';
                setTimeout(() => {
                    bar.style.boxShadow = '0 0 10px rgba(0, 255, 255, 0.3)';
                }, 300);
            }, 1500);
        }, index * 300);
    });
}

// Enhanced hover effects with 3D transforms
document.querySelectorAll('.overview-card, .about-card, .project-card').forEach(card => {
    card.addEventListener('mouseenter', function () {
        this.style.transform = 'translateY(-12px) scale(1.02) rotateX(5deg)';
        this.style.transition = 'all 0.4s cubic-bezier(0.4, 0, 0.2, 1)';
    });

    card.addEventListener('mouseleave', function () {
        this.style.transform = 'translateY(0) scale(1) rotateX(0deg)';
    });
});

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

// Add dynamic typing effect to hero title
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

    setTimeout(typeWriter, 1500);
}

// Enhanced contact form interactions
const contactForm = document.querySelector('.contact-form');
if (contactForm) {
    const inputs = contactForm.querySelectorAll('.form-input, .form-textarea');

    inputs.forEach(input => {
        input.addEventListener('focus', function () {
            this.style.borderColor = 'rgba(0, 255, 255, 0.6)';
            this.style.background = 'rgba(0, 255, 255, 0.1)';
            this.style.transform = 'translateY(-2px)';
        });

        input.addEventListener('blur', function () {
            this.style.borderColor = 'rgba(0, 255, 255, 0.2)';
            this.style.background = 'rgba(0, 255, 255, 0.05)';
            this.style.transform = 'translateY(0)';
        });
    });
}

// Add CSS for additional animations
const additionalStyles = `
    .animate-in {
        animation: slideInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1) forwards;
    }
    
    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(40px) scale(0.95);
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
        transform: translateX(10px) rotateY(5deg);
    }
`;

const styleSheet = document.createElement('style');
styleSheet.textContent = additionalStyles;
document.head.appendChild(styleSheet);

// Enhanced Counter animation for stats (supports increment and decrement)
function animateCounter(element, target, startValue = 0, direction = 'up', prefix = '', suffix = '') {
    let current = startValue;
    const duration = 2000; // 2 seconds
    const steps = 60;
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
                // Add final glow effect
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
                // Add final glow effect
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

// Observe stats section for animation
const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const statNumbers = entry.target.querySelectorAll('.stat-number[data-count]');
            statNumbers.forEach((stat, index) => {
                const target = parseInt(stat.getAttribute('data-count'));
                const startValue = parseInt(stat.getAttribute('data-start')) || 0;
                const direction = stat.getAttribute('data-direction') || 'up';
                
                stat.classList.add('counting');
                
                // Stagger the animations
                setTimeout(() => {
                    if (direction === 'down') {
                        animateCounter(stat, target, startValue, 'down', 'Top ', '');
                    } else {
                        animateCounter(stat, target, startValue, 'up', '', '');
                    }
                }, index * 200);
            });
            
            // Only run once
            statsObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.3 });

const statsSection = document.querySelector('.stats');
if (statsSection) {
    statsObserver.observe(statsSection);
}

// Photo Gallery - Fixed 3-Photo Display with Fade Animation
document.addEventListener('DOMContentLoaded', function() {
    const photoSlots = {
        left: document.getElementById('photo-left'),
        center: document.getElementById('photo-center'),
        right: document.getElementById('photo-right')
    };
    
    const dots = document.querySelectorAll('.dot');
    
    // Photo array (7 photos)
    const photos = [
        'images/1.jpg',
        'images/2.jpg', 
        'images/3.jpg',
        'images/4.jpg',
        'images/5.jpg',
        'images/6.jpg',
        'images/7.jpg',
        'images/8.jpg'
    ];
    
    let currentIndex = 0;
    let autoRotateInterval;
    
    function updatePhotos() {
        const leftIndex = (currentIndex - 1 + photos.length) % photos.length;
        const centerIndex = currentIndex;
        const rightIndex = (currentIndex + 1) % photos.length;
        
        // Update images with fade effect
        updatePhotoSlot(photoSlots.left, photos[leftIndex], false);
        updatePhotoSlot(photoSlots.center, photos[centerIndex], true);
        updatePhotoSlot(photoSlots.right, photos[rightIndex], false);
        
        // Update dots
        dots.forEach((dot, index) => {
            dot.classList.toggle('active', index === currentIndex);
        });
    }
    
    function updatePhotoSlot(slot, imageSrc, isCenter) {
        const img = slot.querySelector('.gallery-image');
        
        // Fade out
        slot.classList.add('fade-out');
        
        setTimeout(() => {
            // Change image
            img.src = imageSrc;
            
            // Fade in
            slot.classList.remove('fade-out');
            slot.classList.add('fade-in');
            
            // Update center class
            if (isCenter) {
                slot.classList.add('center');
            } else {
                slot.classList.remove('center');
            }
            
            setTimeout(() => {
                slot.classList.remove('fade-in');
                slot.classList.add('active');
            }, 50);
            
        }, 300);
    }
    
    function nextPhoto() {
        currentIndex = (currentIndex + 1) % photos.length;
        updatePhotos();
    }
    
    function goToPhoto(index) {
        currentIndex = index;
        updatePhotos();
    }
    
    // Auto rotation every 1.5 seconds
    function startAutoRotate() {
        autoRotateInterval = setInterval(nextPhoto, 1500);
    }
    
    function stopAutoRotate() {
        clearInterval(autoRotateInterval);
    }
    
    // Dot navigation
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            stopAutoRotate();
            goToPhoto(index);
            setTimeout(startAutoRotate, 3000); // Resume after 3 seconds
        });
    });
    
    // Pause on hover
    const gallery = document.querySelector('.photo-display');
    if (gallery) {
        gallery.addEventListener('mouseenter', stopAutoRotate);
        gallery.addEventListener('mouseleave', startAutoRotate);
    }
    
    // Initialize
    updatePhotos();
    startAutoRotate();
});