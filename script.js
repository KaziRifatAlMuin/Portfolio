function submitForm() {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;

    console.log("Name:", name, "Email:", email, "Message:", message); // Debugging

    if (name && email && message) {
        alert("Message sent successfully!");
        document.getElementById('contact-form').reset(); // Reset form fields
        return true; // Allow form submission
    } else {
        alert("Please fill out all fields.");
        return false; // Prevent form submission
    }
}

// Smooth scrolling for navigation links
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

// Header scroll effect
window.addEventListener('scroll', () => {
    const header = document.querySelector('header');
    if (window.scrollY > 100) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});

// Intersection Observer for fade-in animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
        }
    });
}, observerOptions);

// Observe all sections with fade-in-section class
document.querySelectorAll('.fade-in-section').forEach(section => {
    observer.observe(section);
});

// Typing effect for hero text
function typeWriter(element, text, speed = 50) {
    let i = 0;
    element.innerHTML = '';
    
    function type() {
        if (i < text.length) {
            element.innerHTML += text.charAt(i);
            i++;
            setTimeout(type, speed);
        }
    }
    
    type();
}

// Initialize typing effects when page loads
window.addEventListener('load', () => {
    const typingText = document.querySelector('.typing-text');
    const typingSubtitle = document.querySelector('.typing-subtitle');
    
    if (typingText) {
        setTimeout(() => {
            typeWriter(typingText, "Hi, I'm ", 100);
        }, 1000);
    }
    
    if (typingSubtitle) {
        setTimeout(() => {
            typeWriter(typingSubtitle, "Competitive Programmer & Developer", 80);
        }, 3000);
    }
});

// Add hover effects to cards
document.querySelectorAll('.skill-card, .project-card, .education-card').forEach(card => {
    card.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-10px) scale(1.02)';
    });
    
    card.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0) scale(1)';
    });
});

// Parallax effect for background particles
window.addEventListener('scroll', () => {
    const scrolled = window.pageYOffset;
    const particles = document.querySelectorAll('.particle');
    
    particles.forEach((particle, index) => {
        const speed = (index + 1) * 0.5;
        particle.style.transform = `translateY(${scrolled * speed}px)`;
    });
});
