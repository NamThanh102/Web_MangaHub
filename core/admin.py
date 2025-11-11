from django.contrib import admin  # Thư viện admin của Django
from .models import (  # Import các model từ app hiện tại
    Category, Comic, Chapter, Page,
    Favorite, ReadingHistory, User
)

# Hủy đăng ký User mặc định để tùy chỉnh riêng
admin.site.unregister(User)

class PageInline(admin.TabularInline):
    model = Page    # Model sẽ được hiển thị (Trang)
    extra = 1       # Thêm 1 dòng trống để tạo trang mới

class ChapterInline(admin.TabularInline):
    model = Chapter  # Model sẽ được hiển thị (Chương)
    extra = 1                   # Thêm 1 dòng trống để tạo chương mới
    show_change_link = True     # Hiển thị link để chỉnh sửa chi tiết chương

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'description', 'created_at']  # Các cột hiển thị trong danh sách
    search_fields = ['name']    # Các trường có thể tìm kiếm

@admin.register(Comic)
class ComicAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'status', 'views', 'created_at']  # Các cột hiển thị
    list_filter = ['status', 'created_at']  # Các trường dùng để lọc dữ liệu
    search_fields = ['title', 'author']     # Các trường có thể tìm kiếm
    inlines = [ChapterInline]               # Hiển thị ChapterInline để quản lý chương

@admin.register(Chapter)
class ChapterAdmin(admin.ModelAdmin):
    list_display = ['comic', 'title', 'chapter_number', 'created_at']  # Các cột hiển thị
    list_filter = ['comic', 'created_at']       # Các trường dùng để lọc dữ liệu
    search_fields = ['title', 'comic__title']   # Các trường có thể tìm kiếm
    inlines = [PageInline]                  # Hiển thị PageInline để quản lý trang
    ordering = ['comic', 'chapter_number']  # Sắp xếp mặc định

@admin.register(Page)
class PageAdmin(admin.ModelAdmin):
    list_display = ['chapter', 'page_number']  # Các cột hiển thị
    list_filter = ['chapter__comic']        # Lọc theo truyện thông qua liên kết chương
    ordering = ['chapter', 'page_number']   # Sắp xếp mặc định

@admin.register(Favorite)
class FavoriteAdmin(admin.ModelAdmin):
    list_display = ['user', 'comic', 'added_at']  # Các cột hiển thị
    list_filter = ['user', 'added_at']  # Các trường dùng để lọc dữ liệu
    readonly_fields = ['added_at']      # Trường chỉ đọc (tự động tạo)

@admin.register(ReadingHistory)
class ReadingHistoryAdmin(admin.ModelAdmin):
    list_display = ['user', 'comic', 'chapter', 'read_at']  # Các cột hiển thị
    list_filter = ['user', 'comic', 'read_at']  # Các trường dùng để lọc dữ liệu
    readonly_fields = ['read_at']               # Trường chỉ đọc (tự động tạo)

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ['username', 'email', 'is_staff', 'is_superuser', 'date_joined']  # Các cột hiển thị
    search_fields = ['username', 'email']           # Các trường có thể tìm kiếm
    list_filter = ['is_staff', 'is_superuser']      # Các trường dùng để lọc dữ liệu
