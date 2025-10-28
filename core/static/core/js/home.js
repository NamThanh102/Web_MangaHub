document.addEventListener('DOMContentLoaded', function() {
    const categories = document.querySelectorAll('.category');
    categories.forEach(category => {
        category.addEventListener('click', function() {
            categories.forEach(c => c.classList.remove('active'));
            this.classList.add('active');
            
            const categoryName = this.textContent.trim();
            if (categoryName !== 'Tất cả') {
                window.location.href = `/comics/?category=${encodeURIComponent(categoryName)}`;
            } else {
                window.location.href = '/comics/';
            }
        });
    });
});
document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.slide');
    const dots = document.querySelectorAll('.dot');
    let currentSlide = 0;
    let slideInterval;
    const slideDuration = 2000; // 5 giây mỗi slide

    // Hàm chuyển slide
    function showSlide(n) {
        slides.forEach(slide => {
            slide.classList.remove('active');
        });
        dots.forEach(dot => {
            dot.classList.remove('active');
        });
        
        // Hiển thị slide được chọn
        currentSlide = (n + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
        dots[currentSlide].classList.add('active');
    }

    // Hàm chuyển sang slide tiếp theo
    function nextSlide() {
        showSlide(currentSlide + 1);
    }

    // Bắt đầu slideshow tự động
    function startSlideShow() {
        slideInterval = setInterval(nextSlide, slideDuration);
    }

    // Dừng slideshow
    function stopSlideShow() {
        clearInterval(slideInterval);
    }

    // Thêm sự kiện click cho dots
    dots.forEach((dot, index) => {
        dot.addEventListener('click', function() {
            stopSlideShow();
            showSlide(index);
            startSlideShow();
        });
        
        // Thêm hover effect
        dot.addEventListener('mouseenter', function() {
            stopSlideShow();
        });
        
        dot.addEventListener('mouseleave', function() {
            startSlideShow();
        });
    });

    // Tạm dừng slideshow khi hover vào hero section
    const hero = document.querySelector('.hero');
    hero.addEventListener('mouseenter', stopSlideShow);
    hero.addEventListener('mouseleave', startSlideShow);

    showSlide(0);
    startSlideShow();


    function preloadImages() {
        const imageUrls = [
            "{% static 'images/hero-bg1.jpg' %}",
            "{% static 'images/hero-bg2.jpg' %}",
            "{% static 'images/hero-bg3.jpg' %}",
            "{% static 'images/hero-bg4.jpg' %}"
        ];
        
        imageUrls.forEach(url => {
            const img = new Image();
            img.src = url;
        });
    }
    
    preloadImages();
});