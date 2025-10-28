from django.contrib import admin
from .models import (
    Category, Comic, Chapter, Page,
    Favorite, ReadingHistory, User
)

admin.site.unregister(User)

class PageInline(admin.TabularInline):
    model = Page
    extra = 1

class ChapterInline(admin.TabularInline):
    model = Chapter
    extra = 1
    show_change_link = True

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'description', 'created_at']
    search_fields = ['name']

@admin.register(Comic)
class ComicAdmin(admin.ModelAdmin):
    list_display = ['title', 'author', 'status', 'views', 'created_at']
    list_filter = ['status', 'created_at']
    search_fields = ['title', 'author']
    inlines = [ChapterInline]

@admin.register(Chapter)
class ChapterAdmin(admin.ModelAdmin):
    list_display = ['comic', 'title', 'chapter_number', 'created_at']
    list_filter = ['comic', 'created_at']
    search_fields = ['title', 'comic__title']
    inlines = [PageInline]
    ordering = ['comic', 'chapter_number']


@admin.register(Page)
class PageAdmin(admin.ModelAdmin):
    list_display = ['chapter', 'page_number']
    list_filter = ['chapter__comic']
    ordering = ['chapter', 'page_number']

@admin.register(Favorite)
class FavoriteAdmin(admin.ModelAdmin):
    list_display = ['user', 'comic', 'added_at']
    list_filter = ['user', 'added_at']
    readonly_fields = ['added_at']

@admin.register(ReadingHistory)
class ReadingHistoryAdmin(admin.ModelAdmin):
    list_display = ['user', 'comic', 'chapter', 'read_at']
    list_filter = ['user', 'comic', 'read_at']
    readonly_fields = ['read_at']

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ['username', 'email', 'is_staff', 'is_superuser', 'date_joined']
    search_fields = ['username', 'email']
    list_filter = ['is_staff', 'is_superuser']
