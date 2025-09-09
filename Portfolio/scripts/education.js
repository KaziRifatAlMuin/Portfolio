// Simple Education Timeline Scroll Animation
document.addEventListener('DOMContentLoaded', function () {
    const timeline = document.querySelector('.education-timeline');
    const timelineItems = document.querySelectorAll('.timeline-item');

    if (!timeline || !timelineItems.length) return;

    // Create the line element dynamically since ::before is hard to control
    const line = document.createElement('div');
    line.className = 'timeline-line';
    line.style.cssText = `
        position: absolute;
        left: 40px;
        top: 60px;
        width: 2px;
        height: 0px;
        background: linear-gradient(180deg, rgba(0, 255, 255, 0.6), rgba(64, 224, 208, 0.4));
        z-index: 1;
        border-radius: 1px;
        transition: height 0.3s ease-out;
        transform-origin: top;
    `;
    timeline.appendChild(line);

    function handleScrollAnimation() {
        const windowHeight = window.innerHeight;
        const timelineRect = timeline.getBoundingClientRect();
        let lastVisibleLogoBottom = 0;

        timelineItems.forEach((item, index) => {
            const itemRect = item.getBoundingClientRect();
            const marker = item.querySelector('.timeline-marker');

            // If item is visible (coming into view)
            if (itemRect.top < windowHeight * 0.8) {
                // Show the item
                if (!item.classList.contains('item-visible')) {
                    setTimeout(() => {
                        item.classList.add('item-visible');
                    }, index * 150);
                }

                // Calculate the exact position of this logo relative to timeline
                if (marker) {
                    const markerRect = marker.getBoundingClientRect();
                    const markerTopInTimeline = markerRect.top - timelineRect.top;
                    const markerCenterInTimeline = markerTopInTimeline + (marker.offsetHeight / 2);

                    // Update the line to reach this logo's center
                    lastVisibleLogoBottom = markerCenterInTimeline;
                }
            }
        });

        // Update line height to connect only to the last visible logo
        if (lastVisibleLogoBottom > 0) {
            // Subtract the initial top offset (60px) to get the actual height needed
            const lineHeight = lastVisibleLogoBottom - 60;
            line.style.height = `${Math.max(0, lineHeight)}px`;
        }
    }

    // Add scroll listener
    window.addEventListener('scroll', handleScrollAnimation);

    // Initialize on load
    handleScrollAnimation();
});