from django.db import models
from django.utils import timezone
from django.urls import reverse
from django.utils.text import slugify
from django.contrib.auth.models import User

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

class Chapter(models.Model):
    comic = models.ForeignKey(Comic, on_delete=models.CASCADE, related_name='chapters', verbose_name="Truyện")
    title = models.CharField(max_length=200, verbose_name="Tiêu đề chương")
    chapter_number = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Số chương")
    slug = models.SlugField(blank=True, verbose_name="Slug")
    created_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        verbose_name = "Chương"
        verbose_name_plural = "Chương"
        ordering = ['chapter_number']
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

def page_upload_to(instance, filename):
    comic_slug = instance.chapter.comic.slug
    chapter_number = instance.chapter.chapter_number
    return f"comics/{comic_slug}/chapter_{chapter_number}/{filename}"

class Page(models.Model):
    chapter = models.ForeignKey(Chapter, on_delete=models.CASCADE, related_name='pages', verbose_name="Chương")
    image = models.ImageField(upload_to=page_upload_to, verbose_name="Trang truyện")
    page_number = models.PositiveIntegerField(verbose_name="Số trang")
    
    class Meta:
        verbose_name = "Trang"
        verbose_name_plural = "Trang"
        ordering = ['page_number']
    
    def __str__(self):
        return f"{self.chapter.comic.title} - Ch.{self.chapter.chapter_number} - Trang {self.page_number}"


class ReadingHistory(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='reading_history', verbose_name="Người dùng")
    comic = models.ForeignKey(Comic, on_delete=models.CASCADE, related_name='reading_history', verbose_name="Truyện")
    chapter = models.ForeignKey(Chapter, on_delete=models.CASCADE, verbose_name="Chương")
    page_number = models.PositiveIntegerField(default=1, verbose_name="Trang hiện tại")
    read_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "Lịch sử đọc"
        verbose_name_plural = "Lịch sử đọc"
        ordering = ['-read_at']
        unique_together = ['user', 'comic']
        indexes = [
            models.Index(fields=['user', '-read_at']),
        ]
    
    def __str__(self):
        return f"{self.user.username} - {self.comic.title} - Ch.{self.chapter.chapter_number}"

class Favorite(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='favorites', verbose_name="Người dùng")
    comic = models.ForeignKey(Comic, on_delete=models.CASCADE, related_name='favorites', verbose_name="Truyện")
    added_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        verbose_name = "Yêu thích"
        verbose_name_plural = "Yêu thích"
        unique_together = ['user', 'comic']
        ordering = ['-added_at']
    
    def __str__(self):
        return f"{self.user.username} - {self.comic.title}"