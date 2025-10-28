    document.addEventListener('DOMContentLoaded', function() {
        
    const modals = document.querySelectorAll('.modal');
    const modalTriggers = document.querySelectorAll('[data-modal-target]');
    
    modalTriggers.forEach(trigger => {
        trigger.addEventListener('click', function(e) {
            e.preventDefault();
            const target = this.getAttribute('data-modal-target');
            const modal = document.querySelector(target);
            if (modal) {
                modal.style.display = 'flex';
                document.body.style.overflow = 'hidden';
            }
        });
    });
    
    document.querySelectorAll('.close-modal').forEach(closeBtn => {
        closeBtn.addEventListener('click', function() {
            const modal = this.closest('.modal');
            modal.style.display = 'none';
            document.body.style.overflow = 'auto';
            resetForms();
        });
    });
    
    modals.forEach(modal => {
        modal.addEventListener('click', function(e) {
            if (e.target === this) {
                this.style.display = 'none';
                document.body.style.overflow = 'auto';
                resetForms();
            }
        });
    });
    
    const selectComicBtns = document.querySelectorAll('.select-comic-btn, .add-chapter-to-comic');
    const addChapterModal = document.getElementById('add-chapter-modal');
    const selectedComicTitle = document.getElementById('selected-comic-title');
    const selectedComicId = document.getElementById('selected-comic-id');
    
    selectComicBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const comicId = this.getAttribute('data-comic-id');
            const comicTitle = this.getAttribute('data-comic-title');
            
            selectedComicTitle.textContent = comicTitle;
            selectedComicId.value = comicId;
            
            calculateNextChapterNumber(comicId);
            
            document.getElementById('select-comic-modal').style.display = 'none';
            addChapterModal.style.display = 'flex';
        });
    });

    function calculateNextChapterNumber(comicId) {

        const nextChapterNumber = document.getElementById('next-chapter-number');
        const currentValue = parseInt(nextChapterNumber.textContent) || 0;
        nextChapterNumber.textContent = currentValue + 1;
        
        document.getElementById('chapter-number').value = currentValue + 1;
    }
    
    const uploadArea = document.getElementById('upload-area');
    const fileInput = document.getElementById('chapter-content');
    const uploadPreview = document.getElementById('upload-preview');
    const previewGrid = document.getElementById('preview-grid');
    const selectedCount = document.getElementById('selected-count');
    const submitChapter = document.getElementById('submit-chapter');
    const clearSelection = document.getElementById('clear-selection');
    
    uploadArea.addEventListener('click', function() {
        fileInput.click();
    });
    
    uploadArea.addEventListener('dragover', function(e) {
        e.preventDefault();
        this.classList.add('dragover');
    });
    
    uploadArea.addEventListener('dragleave', function() {
        this.classList.remove('dragover');
    });
    
    uploadArea.addEventListener('drop', function(e) {
        e.preventDefault();
        this.classList.remove('dragover');
        const files = e.dataTransfer.files;
        handleFiles(files);
    });

    fileInput.addEventListener('change', function() {
        handleFiles(this.files);
    });

    function handleFiles(files) {
        if (files.length > 0) {
            uploadPreview.style.display = 'block';
            previewGrid.innerHTML = '';           
            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                if (file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const previewItem = document.createElement('div');
                        previewItem.className = 'preview-item';
                        previewItem.innerHTML = `
                            <img src="${e.target.result}" alt="Preview">
                            <button type="button" class="preview-remove" data-index="${i}">&times;</button>
                        `;
                        previewGrid.appendChild(previewItem);
                        selectedCount.textContent = previewGrid.children.length;
                        submitChapter.disabled = previewGrid.children.length === 0;
                    };
                    reader.readAsDataURL(file);
                }
            }
        }
    }
    previewGrid.addEventListener('click', function(e) {
        if (e.target.classList.contains('preview-remove')) {
            const index = e.target.getAttribute('data-index');
            e.target.closest('.preview-item').remove();
            selectedCount.textContent = previewGrid.children.length;
            submitChapter.disabled = previewGrid.children.length === 0;
        }
    });
    clearSelection.addEventListener('click', function() {
        previewGrid.innerHTML = '';
        uploadPreview.style.display = 'none';
        fileInput.value = '';
        submitChapter.disabled = true;
    });
    const comicSearch = document.getElementById('comic-search');
    if (comicSearch) {
        comicSearch.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const comicItems = document.querySelectorAll('.comic-select-item');
            
            comicItems.forEach(item => {
                const title = item.querySelector('h4').textContent.toLowerCase();
                if (title.includes(searchTerm)) {
                    item.style.display = 'flex';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    }

    function resetForms() {
        document.querySelectorAll('form').forEach(form => {
            form.reset();
        });
        
        if (previewGrid) {
            previewGrid.innerHTML = '';
            if (uploadPreview) {
                uploadPreview.style.display = 'none';
            }
            if (submitChapter) {
                submitChapter.disabled = true;
            }
        }
    }
    // Form submissions
    // document.getElementById('add-comic-form')?.addEventListener('submit', function(e) {
    //     e.preventDefault();
    //     // Add your form submission logic here
    //     alert('Truyện đã được thêm thành công!');
    //     this.reset();
    //     document.getElementById('add-comic-modal').style.display = 'none';
    //     document.body.style.overflow = 'auto';
    // });
    
    // document.getElementById('add-chapter-form')?.addEventListener('submit', function(e) {
    //     e.preventDefault();
    //     // Add your form submission logic here
    //     alert('Chương đã được thêm thành công!');
    //     this.reset();
    //     document.getElementById('add-chapter-modal').style.display = 'none';
    //     document.body.style.overflow = 'auto';
    // });
});