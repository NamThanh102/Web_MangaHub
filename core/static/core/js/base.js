// Base JavaScript for common functionality
document.addEventListener('DOMContentLoaded', function() {
    // Add any common JavaScript functionality here
    console.log('MangaHub loaded successfully');
});

// Thêm vào file base.js hoặc script block
document.addEventListener('DOMContentLoaded', function() {
    // Mảng chứa các ảnh nền có sẵn
    const backgroundImages = [
        "{% static 'core/images/a3.jpg' %}",
        "{% static 'core/images/a4.jpg' %}",
        "{% static 'core/images/a5.jpg' %}"
    ];
    
    // Chọn ngẫu nhiên ảnh nền
    const randomBg = backgroundImages[Math.floor(Math.random() * backgroundImages.length)];
    
    // Tạo style element để thay đổi ảnh nền
    const style = document.createElement('style');
    style.textContent = `
        body::after {
            background-image: url('${randomBg}');
        }
    `;
    document.head.appendChild(style);
    
    // Hoặc cho phép người dùng chọn ảnh nền
    const bgSelector = document.createElement('select');
    bgSelector.innerHTML = `
        <option value="default">Mặc định</option>
        <option value="manga">Manga Style</option>
        <option value="gradient">Gradient</option>
        <option value="pattern">Pattern</option>
    `;
    bgSelector.style.position = 'fixed';
    bgSelector.style.bottom = '10px';
    bgSelector.style.right = '10px';
    bgSelector.style.zIndex = '1000';
    bgSelector.style.background = 'rgba(26, 26, 26, 0.8)';
    bgSelector.style.color = 'white';
    bgSelector.style.border = '1px solid #ff6b6b';
    bgSelector.style.borderRadius = '5px';
    bgSelector.style.padding = '5px';
    
    bgSelector.addEventListener('change', function() {
        document.body.className = this.value + '-bg';
    });
    
    // document.body.appendChild(bgSelector); // Bỏ comment nếu muốn thêm selector
});