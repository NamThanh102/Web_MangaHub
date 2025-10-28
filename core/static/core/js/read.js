document.addEventListener('DOMContentLoaded', function() {
    // Fullscreen functionality
    const fullscreenBtn = document.getElementById('fullscreen-btn');
    const pageContainer = document.querySelector('.page-container');
    
    fullscreenBtn.addEventListener('click', function() {
        if (!document.fullscreenElement) {
            if (pageContainer.requestFullscreen) {
                pageContainer.requestFullscreen();
            } else if (pageContainer.webkitRequestFullscreen) {
                pageContainer.webkitRequestFullscreen();
            } else if (pageContainer.msRequestFullscreen) {
                pageContainer.msRequestFullscreen();
            }
        } else {
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
        }
    });

    // Reading mode functionality
    const readingModes = document.querySelectorAll('.reading-mode');
    
    readingModes.forEach(mode => {
        mode.addEventListener('click', function() {
            readingModes.forEach(m => m.classList.remove('active'));
            this.classList.add('active');
            
            const modeType = this.getAttribute('data-mode');
            pageContainer.classList.remove('vertical', 'horizontal');
            pageContainer.classList.add(modeType);
        });
    });

    // Keyboard navigation
    document.addEventListener('keydown', function(e) {
        const prevChapter = document.querySelector('.nav-button.prev');
        const nextChapter = document.querySelector('.nav-button.next');
        
        switch(e.key) {
            case 'ArrowLeft':
                if (prevChapter) prevChapter.click();
                break;
            case 'ArrowRight':
                if (nextChapter) nextChapter.click();
                break;
            case 'Escape':
                if (document.fullscreenElement) {
                    document.exitFullscreen();
                }
                break;
        }
    });
});