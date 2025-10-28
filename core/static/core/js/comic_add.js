// comic_add.js
document.addEventListener('DOMContentLoaded', function() {
    const coverInput = document.getElementById("id_cover_image");
    const previewContainer = document.getElementById("cover-preview-container");
    const form = document.getElementById("comicForm");
    const submitBtn = document.getElementById("submitBtn");
    const btnText = submitBtn.querySelector('.btn-text');
    const btnLoading = submitBtn.querySelector('.btn-loading');

    // Preview ảnh bìa
    if (coverInput) {
        coverInput.addEventListener("change", function(e) {
            previewContainer.innerHTML = "";
            const file = e.target.files[0];
            
            if (file) {
                // Kiểm tra loại file
                if (!file.type.match('image.*')) {
                    showError('Vui lòng chọn file ảnh hợp lệ');
                    return;
                }
                
                // Kiểm tra kích thước file (max 5MB)
                if (file.size > 5 * 1024 * 1024) {
                    showError('Kích thước ảnh không được vượt quá 5MB');
                    return;
                }
                
                const preview = document.createElement("img");
                preview.src = URL.createObjectURL(file);
                preview.alt = "Preview cover image";
                preview.className = "cover-preview";
                previewContainer.appendChild(preview);
                
                // Clean up URL khi component unmount
                preview.onload = function() {
                    URL.revokeObjectURL(preview.src);
                };
            } else {
                previewContainer.innerHTML = '<div class="preview-placeholder">Ảnh bìa sẽ xuất hiện ở đây</div>';
            }
        });
    }

    // Xử lý form submission
    if (form) {
        form.addEventListener('submit', function(e) {
            // Hiển thị loading state
            btnText.style.display = 'none';
            btnLoading.style.display = 'flex';
            submitBtn.disabled = true;
        });
    }

    // Real-time validation
    const inputs = form.querySelectorAll('input, textarea, select');
    inputs.forEach(input => {
        input.addEventListener('blur', function() {
            validateField(this);
        });
        
        input.addEventListener('input', function() {
            clearFieldError(this);
        });
    });

    function validateField(field) {
        const formGroup = field.closest('.form-group');
        if (!formGroup) return;

        // Xóa error cũ
        clearFieldError(field);

        // Required field validation
        if (field.hasAttribute('required') && !field.value.trim()) {
            showFieldError(field, 'Trường này là bắt buộc');
            return false;
        }

        // Email validation
        if (field.type === 'email' && field.value) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(field.value)) {
                showFieldError(field, 'Email không hợp lệ');
                return false;
            }
        }

        // URL validation
        if (field.type === 'url' && field.value) {
            try {
                new URL(field.value);
            } catch {
                showFieldError(field, 'URL không hợp lệ');
                return false;
            }
        }

        return true;
    }

    function showFieldError(field, message) {
        const formGroup = field.closest('.form-group');
        formGroup.classList.add('has-error');
        
        let errorDiv = formGroup.querySelector('.field-errors');
        if (!errorDiv) {
            errorDiv = document.createElement('div');
            errorDiv.className = 'field-errors';
            formGroup.appendChild(errorDiv);
        }
        
        errorDiv.innerHTML = `<span class="error">${message}</span>`;
    }

    function clearFieldError(field) {
        const formGroup = field.closest('.form-group');
        if (formGroup) {
            formGroup.classList.remove('has-error');
            const errorDiv = formGroup.querySelector('.field-errors');
            if (errorDiv) {
                errorDiv.remove();
            }
        }
    }

    function showError(message) {
        // Có thể sử dụng toast notification thay vì alert
        alert(message); // Tạm thời dùng alert, có thể thay bằng toast đẹp hơn
    }
});