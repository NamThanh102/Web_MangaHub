from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import login, authenticate
from django.contrib import messages
from django.db import connection
from django.utils import timezone
from django.http import JsonResponse
from django.contrib.auth.models import User
from .models import Comic, Chapter, Category, ReadingHistory, Favorite
from .forms import UserRegistrationForm
from django.contrib.auth import authenticate, login as auth_login
import logging
from django.db.models import Q

logger = logging.getLogger(__name__)

def home(request):
    categories = Category.objects.all()
    comics = Comic.objects.order_by('-updated_at')[:8]
    popular_comics = Comic.objects.order_by('-views')[:8]
    context = {
        'categories': categories,
        'comics': comics,
        'popular_comics': popular_comics
    }
    return render(request, 'core/home.html', context)

def comic_list(request):
    category_slug = request.GET.get('category')
    search_query = request.GET.get('search')
    comics = Comic.objects.all()
    if category_slug:
        comics = comics.filter(categories__slug=category_slug)
    if search_query:
        comics = comics.filter(
            Q(title__icontains=search_query) |
            Q(author__icontains=search_query) |
            Q(description__icontains=search_query)
        )
    categories = Category.objects.all()
    context = {
        'comics': comics,
        'categories': categories,
        'selected_category': category_slug,
        'search_query': search_query,
    }
    return render(request, 'core/comic_list.html', context)

def comic_detail(request, comic_id):
    comic = get_object_or_404(Comic, id=comic_id)
    chapters = comic.chapters.all().order_by('chapter_number')
    
    comic.views += 1
    comic.save()
    
    is_favorite = False
    latest_read_chapter = None
    if request.user.is_authenticated:
        is_favorite = Favorite.objects.filter(user=request.user, comic=comic).exists()
        latest_history = ReadingHistory.objects.filter(
            user=request.user, 
            comic=comic
        ).order_by('-read_at').first()
        if latest_history:
            latest_read_chapter = latest_history.chapter
    
    context = {
        'comic': comic,
        'chapters': chapters,
        'is_favorite': is_favorite,
        'latest_read_chapter': latest_read_chapter,
    }
    return render(request, 'core/comic_detail.html', context)

from django.db import transaction

@login_required
def read_chapter(request, chapter_id):
    chapter = get_object_or_404(
        Chapter.objects.select_related('comic'), 
        id=chapter_id
    )

    pages = chapter.pages.all().order_by('page_number')

    with transaction.atomic():
        ReadingHistory.objects.update_or_create(
            user=request.user,
            comic=chapter.comic,
            defaults={
                'chapter': chapter,
                'read_at': timezone.now()
            }
        )
    chapters = Chapter.objects.filter(comic=chapter.comic).only('id', 'chapter_number')
    
    prev_chapter = chapters.filter(
        chapter_number__lt=chapter.chapter_number
    ).order_by('-chapter_number').first()
    
    next_chapter = chapters.filter(
        chapter_number__gt=chapter.chapter_number
    ).order_by('chapter_number').first()
    
    context = {
        'chapter': chapter,
        'pages': pages,
        'prev_chapter': prev_chapter,
        'next_chapter': next_chapter,
    }
    return render(request, 'core/read_chapter.html', context)

@login_required
def toggle_favorite(request, comic_id):
    comic = get_object_or_404(Comic, id=comic_id)
    
    if request.method == 'POST':
        favorite, created = Favorite.objects.get_or_create(
            user=request.user,
            comic=comic
        )
        
        if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
            if not created:
                favorite.delete()
                return JsonResponse({
                    'status': 'removed', 
                    'message': f'Đã xóa {comic.title} khỏi danh sách yêu thích',
                    'favorite_count': comic.favorites.count()
                })
            else:
                return JsonResponse({
                    'status': 'added',
                    'message': f'Đã thêm {comic.title} vào danh sách yêu thích',
                    'favorite_count': comic.favorites.count()
                })
        else:
            if not created:
                favorite.delete()
                messages.success(request, f'Đã xóa {comic.title} khỏi danh sách yêu thích')
            else:
                messages.success(request, f'Đã thêm {comic.title} vào danh sách yêu thích')
    
    return redirect('comic_detail', comic_id=comic_id)

@login_required
def reading_history(request):
    history = ReadingHistory.objects.filter(user=request.user).select_related('comic', 'chapter').order_by('-read_at')
    return render(request, 'core/reading_history.html', {'history': history})

@login_required
def favorites(request):
    favorite_comics = Favorite.objects.filter(user=request.user).select_related('comic')
    return render(request, 'core/favorites.html', {'favorites': favorite_comics})

def register(request):
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Đăng ký thành công!')
            return redirect('home')
    else:
        form = UserRegistrationForm()
    return render(request, 'core/register.html', {'form': form})

def is_admin(user):
    return user.is_staff or user.is_superuser

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)    
        if user is not None:
            auth_login(request, user)
            if user.is_superuser or user.is_staff:
                messages.success(request, f'Chào quản trị viên {user.username}!')
                return redirect('/admin/')
            else:
                messages.success(request, f'Đăng nhập thành công! Xin chào {user.username}.')
                return redirect('home')
        else:
            messages.error(request, 'Sai tên đăng nhập hoặc mật khẩu.')
    
    return render(request, 'core/login.html')

@login_required
def profile(request):
    user = request.user
    favorites_count = Favorite.objects.filter(user=user).count()
    reading_history_count = ReadingHistory.objects.filter(user=user).count()
    
    favorites = Favorite.objects.filter(user=request.user).select_related('comic')
    reading_history = ReadingHistory.objects.filter(user=request.user).select_related('chapter__comic').order_by('-read_at')
    context = {
        'user': user,
        'favorites': favorites,
        'favorite_count': favorites.count(),
        'reading_history': reading_history,
        'reading_count': reading_history.count(),
    }

    if request.method == 'POST':
        user.first_name = request.POST.get('first_name', user.first_name)
        user.last_name = request.POST.get('last_name', user.last_name)
        user.email = request.POST.get('email', user.email)
        user.save()
        messages.success(request, 'Cập nhật thông tin thành công!')
        return redirect('profile')
    return render(request, 'users/profile.html', context)

def about(request):
    return render(request, 'users/about.html')

@login_required
def read(request, comic_id):
    comic = get_object_or_404(Comic, id=comic_id)
    chapters = comic.chapters.all().order_by('chapter_number')
    is_favorite = False
    
    if request.user.is_authenticated:
        is_favorite = Favorite.objects.filter(user=request.user, comic=comic).exists()

    return render(request, 'core/read.html', {
        'comic': comic,
        'chapters': chapters,
        'is_favorite': is_favorite,
    })