"""
╔════════════════════════════════════════════════════════════════════════════════╗
║                  ĐỊNH NGHĨA CÁC Model DATABASE CHO WEBTRUYEN                   ║
╚════════════════════════════════════════════════════════════════════════════════╝
File này chứa tất cả các model (bảng dữ liệu) cho hệ thống quản lý truyện tranh:
    - Category: Danh mục thể loại truyện
    - Comic: Thông tin truyện tranh
    - Chapter: Các chương của truyện
    - Page: Các trang hình ảnh của chương
    - ReadingHistory: Lịch sử đọc của người dùng
    - Favorite: Danh sách yêu thích của người dùng
"""

from django.db import models        # Tạo các class model
from django.utils import timezone   # Để làm việc với thời gian
from django.urls import reverse     # Để tạo URL từ tên view
from django.utils.text import slugify       # Để tạo slug từ chuỗi ký tự
from django.contrib.auth.models import User # Import model User mặc định từ Django

# hàm sinh path lưu trang hình ảnh
def page_upload_to(instance, filename):

    comic_slug = instance.chapter.comic.slug            # Lấy slug của truyện
    chapter_number = instance.chapter.chapter_number    # Lấy số chương

    return f"comics/{comic_slug}/chapter_{chapter_number}/{filename}"   # Trả về đường dẫn hoàn chỉnh

#═══════════════════════════════════════════════════════════════════════════════
# Model Category: DANH MỤC THỂ LOẠI TRUYỆN
#═══════════════════════════════════════════════════════════════════════════════
class Category(models.Model):
    name = models.CharField(max_length=100, verbose_name="Tên thể loại")
    slug = models.SlugField(unique=True, blank=True, verbose_name="Slug")
    created_at = models.DateTimeField(auto_now_add=True)
    description = models.TextField(blank=True, verbose_name="Mô tả")
    
    class Meta:
        verbose_name = "Thể loại"
        verbose_name_plural = "Thể loại"
        ordering = ['name']
    
    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)
    
    def get_absolute_url(self):
        return reverse('category_detail', kwargs={'slug': self.slug})

#═══════════════════════════════════════════════════════════════════════════════
# Model Comic: THÔNG TIN TRUYỆN TRANH
#═══════════════════════════════════════════════════════════════════════════════
class Comic(models.Model):
    STATUS_CHOICES = [
        ('ongoing', 'Đang tiến hành'),
        ('completed', 'Đã hoàn thành'),
        ('hiatus', 'Tạm ngưng'),
    ]
    
    title = models.CharField(max_length=200, verbose_name="Tiêu đề")
    slug = models.SlugField(unique=True, blank=True, verbose_name="Slug")
    author = models.CharField(max_length=100, verbose_name="Tác giả")
    description = models.TextField(verbose_name="Mô tả")
    cover_image = models.ImageField(upload_to='comic_covers/', verbose_name="Ảnh bìa")
    
    # Mối quan hệ N-N với Category
    # related_name='comics' cho phép truy cập truyện từ category
    categories = models.ManyToManyField(Category, related_name='comics', verbose_name="Thể loại")
    
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='ongoing', verbose_name="Trạng thái")
    views = models.PositiveIntegerField(default=0, verbose_name="Lượt xem")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "Truyện tranh"
        verbose_name_plural = "Truyện tranh"
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['-created_at']),
            models.Index(fields=['status']),
        ]
    
    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)
    
    def get_absolute_url(self):
        return reverse('comic_detail', kwargs={'slug': self.slug})
    
    def total_chapters(self):
        return self.chapters.count()
    
    def last_chapter(self):
        return self.chapters.order_by('-chapter_number').first()

#═══════════════════════════════════════════════════════════════════════════════
# Model Chapter: CHƯƠNG CỦA TRUYỆN
#═══════════════════════════════════════════════════════════════════════════════
class Chapter(models.Model):
    # on_delete=CASCADE: nếu xóa truyện, chương cũng bị xóa
    # related_name='chapters': cho phép truy cập chapters từ comic object
    comic = models.ForeignKey(Comic, on_delete=models.CASCADE, related_name='chapters', verbose_name="Truyện")
    title = models.CharField(max_length=200, verbose_name="Tiêu đề chương")
    chapter_number = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Số chương")
    slug = models.SlugField(blank=True, verbose_name="Slug")
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        verbose_name = "Chương"
        verbose_name_plural = "Chương"
        ordering = ['chapter_number']
        # Đảm bảo không có 2 chương cùng số trong 1 truyện
        unique_together = ['comic', 'chapter_number']
        indexes = [
            models.Index(fields=['comic', 'chapter_number']),
        ]
    
    def __str__(self):
        return f"{self.comic.title} - Ch.{self.chapter_number}: {self.title}"
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(f"chapter-{self.chapter_number}")
        super().save(*args, **kwargs)
    
    def get_absolute_url(self):
        return reverse('chapter_detail', kwargs={
            'comic_slug': self.comic.slug,
            'chapter_number': self.chapter_number
        })
    
    def total_pages(self):
        return self.pages.count()

#═══════════════════════════════════════════════════════════════════════════════
# Model: TRANG HÌNH ẢNH CỦA CHƯƠNG
#═══════════════════════════════════════════════════════════════════════════════
class Page(models.Model):
    # on_delete=CASCADE: nếu xóa Chapter, Page cũng bị xóa
    # related_name='pages': cho phép truy cập pages từ chapter object
    chapter = models.ForeignKey(Chapter, on_delete=models.CASCADE, related_name='pages', verbose_name="Chương")
    
    # File hình ảnh của trang (dùng hàm page_upload_to để tự động đặt đường dẫn)
    image = models.ImageField(upload_to=page_upload_to, verbose_name="Trang truyện")
    page_number = models.PositiveIntegerField(verbose_name="Số trang")
    
    class Meta:
        verbose_name = "Trang"
        verbose_name_plural = "Trang"
        ordering = ['page_number']
    
    def __str__(self):
        return f"{self.chapter.comic.title} - Ch.{self.chapter.chapter_number} - Trang {self.page_number}"

#═══════════════════════════════════════════════════════════════════════════════
# Model: LỊCH SỬ ĐỌC CỦA NGƯỜI DÙNG
#═══════════════════════════════════════════════════════════════════════════════
class ReadingHistory(models.Model):
    # on_delete=CASCADE: nếu xóa user, lịch sử cũng bị xóa
    # related_name='reading_history': cho phép truy cập từ user object
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='reading_history', verbose_name="Người dùng")
    
    # Liên kết đến truyện được đọc
    # on_delete=CASCADE: nếu xóa truyện, lịch sử cũng bị xóa
    comic = models.ForeignKey(Comic, on_delete=models.CASCADE, related_name='reading_history', verbose_name="Truyện")

    # Liên kết đến chương hiện tại đang đọc
    chapter = models.ForeignKey(Chapter, on_delete=models.CASCADE, verbose_name="Chương")
    # Trang hiện tại đang đọc
    page_number = models.PositiveIntegerField(default=1, verbose_name="Trang hiện tại")
    
    # Thời gian đọc lần cuối (tự động cập nhật mỗi lần save)
    read_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "Lịch sử đọc"
        verbose_name_plural = "Lịch sử đọc"
        ordering = ['-read_at']
        # Mỗi user chỉ có 1 lịch sử cho 1 truyện (unique constraint)
        unique_together = ['user', 'comic']
        indexes = [
            models.Index(fields=['user', '-read_at']),
        ]
    
    def __str__(self):
        return f"{self.user.username} - {self.comic.title} - Ch.{self.chapter.chapter_number}"

#═══════════════════════════════════════════════════════════════════════════════
# Model: TRUYỆN YÊU THÍCH CỦA NGƯỜI DÙNG
#═══════════════════════════════════════════════════════════════════════════════
class Favorite(models.Model):
    # on_delete=CASCADE: nếu xóa user, danh sách cũng bị xóa
    # related_name='favorites': cho phép truy cập từ user object
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='favorites', verbose_name="Người dùng")

    # on_delete=CASCADE: nếu xóa truyện, yêu thích cũng bị xóa
    # related_name='favorites': cho phép truy cập từ comic object
    comic = models.ForeignKey(Comic, on_delete=models.CASCADE, related_name='favorites', verbose_name="Truyện")
    
    # Thời gian thêm vào danh sách yêu thích (tự động ghi lại)
    added_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        verbose_name = "Yêu thích"
        verbose_name_plural = "Yêu thích"
        # Mỗi user chỉ có thể yêu thích 1 truyện 1 lần (unique constraint)
        unique_together = ['user', 'comic']
        ordering = ['-added_at']
    
    def __str__(self):
        return f"{self.user.username} - {self.comic.title}"