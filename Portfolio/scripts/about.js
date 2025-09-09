// About page specific JavaScript for photo gallery and info cards

// Photo Gallery - Fixed 3-Photo Display with 2.5s Interval
document.addEventListener('DOMContentLoaded', function () {
    const photoSlots = {
        left: document.getElementById('photo-left'),
        center: document.getElementById('photo-center'),
        right: document.getElementById('photo-right')
    };

    const dots = document.querySelectorAll('.dot');

    // Photo array (8 photos as shown in HTML)
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
    let isPaused = false;

    // Update photo display with current selection
    function updatePhotos() {
        const leftIndex = (currentIndex - 1 + photos.length) % photos.length;
        const centerIndex = currentIndex;
        const rightIndex = (currentIndex + 1) % photos.length;

        // Update images with fade effect
        updatePhotoSlot(photoSlots.left, photos[leftIndex], false);
        updatePhotoSlot(photoSlots.center, photos[centerIndex], true);
        updatePhotoSlot(photoSlots.right, photos[rightIndex], false);

        // Update navigation dots
        dots.forEach((dot, index) => {
            dot.classList.toggle('active', index === currentIndex);
        });
    }

    // Update individual photo slot with fade transition
    function updatePhotoSlot(slot, imageSrc, isCenter) {
        const img = slot.querySelector('.gallery-image');

        // Fade out current image
        slot.classList.add('fade-out');

        setTimeout(() => {
            // Change image source
            img.src = imageSrc;

            // Fade in new image
            slot.classList.remove('fade-out');
            slot.classList.add('fade-in');

            // Update center class for scaling
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

    // Navigate to next photo
    function nextPhoto() {
        if (!isPaused) {
            currentIndex = (currentIndex + 1) % photos.length;
            updatePhotos();
        }
    }

    // Navigate to specific photo index
    function goToPhoto(index) {
        currentIndex = index;
        updatePhotos();
    }

    // Start automatic photo rotation with 2.5 second interval
    function startAutoRotate() {
        if (autoRotateInterval) {
            clearInterval(autoRotateInterval);
        }
        autoRotateInterval = setInterval(nextPhoto, 2500); // 2.5 seconds interval
        console.log('Photo rotation started with 2.5s interval');
    }

    // Stop automatic photo rotation
    function stopAutoRotate() {
        if (autoRotateInterval) {
            clearInterval(autoRotateInterval);
            autoRotateInterval = null;
        }
        console.log('Photo rotation paused');
    }

    // Pause on hover
    function pauseRotation() {
        isPaused = true;
        stopAutoRotate();
    }

    // Resume after hover
    function resumeRotation() {
        isPaused = false;
        startAutoRotate();
    }

    // Dot navigation click handlers
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            stopAutoRotate();
            goToPhoto(index);
            // Resume rotation after 3 seconds of inactivity
            setTimeout(() => {
                if (!isPaused) {
                    startAutoRotate();
                }
            }, 3000);
        });
    });

    // Pause auto-rotation on hover of the entire gallery
    const gallery = document.querySelector('.photo-display');
    if (gallery) {
        gallery.addEventListener('mouseenter', pauseRotation);
        gallery.addEventListener('mouseleave', resumeRotation);
    }

    // Also pause on hover of gallery container for better UX
    const galleryContainer = document.querySelector('.gallery-container');
    if (galleryContainer) {
        galleryContainer.addEventListener('mouseenter', pauseRotation);
        galleryContainer.addEventListener('mouseleave', resumeRotation);
    }

    // Initialize gallery
    updatePhotos();
    startAutoRotate();

    console.log('Photo gallery initialized with 2.5s auto-rotation');
});

// Info cards enhanced hover effects
const infoCards = document.querySelectorAll('.info-card');
infoCards.forEach(card => {
    card.addEventListener('mouseenter', function () {
        this.style.transform = 'translateY(-12px) scale(1.05) rotateY(5deg)';
        const icon = this.querySelector('.info-icon');
        if (icon) {
            icon.style.transform = 'scale(1.3) rotate(15deg)';
        }
    });

    card.addEventListener('mouseleave', function () {
        this.style.transform = 'translateY(-8px) scale(1.02)';
        const icon = this.querySelector('.info-icon');
        if (icon) {
            icon.style.transform = 'scale(1.2) rotate(10deg)';
        }
    });
});