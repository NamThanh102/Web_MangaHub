"""
╔════════════════════════════════════════════════════════════════════════════════╗
║                      CÁC VIEW XỬ LÝ LOGIC CHO WEBTRUYEN                        ║
╚════════════════════════════════════════════════════════════════════════════════╝

File này chứa tất cả các view (xử lý logic) cho ứng dụng core:
    - Trang chủ, danh sách truyện, chi tiết truyện
    - Đọc chương, lịch sử đọc, danh sách yêu thích
    - Đăng ký, đăng nhập, thông tin cá nhân
    - Các hàm hỗ trợ

View là nơi xử lý logic trước khi gửi dữ liệu đến template để hiển thị.
"""

from django.db import connection, transaction    # Django ORM - Làm việc với database
from django.db.models import Q

from django.utils import timezone                # Timezone - Làm việc với thời gian
from django.http import JsonResponse             # HTTP - Trả về response JSON hoặc redirect
from django.shortcuts import render, get_object_or_404, redirect      # Shortcut - Hàm tiện lợi của Django

from django.contrib import messages              # Messages - Hiển thị thông báo cho người dùng
from django.contrib.auth import authenticate, login as auth_login    # Authentication - Xác thực và đăng nhập
from django.contrib.auth.models import User      # Model User của Django
from django.contrib.auth.decorators import login_required, user_passes_test # Decorators - Kiểm tra quyền truy cập

# Import các form và model của ứng dụng
from .forms import UserRegistrationForm
from .models import Comic, Chapter, Category, ReadingHistory, Favorite

import logging # Logging - Ghi log để debug
logger = logging.getLogger(__name__)

# Kiểm tra nếu user là admin
def is_admin(user):
    return user.is_staff or user.is_superuser

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: TRANG CHỦ
#═══════════════════════════════════════════════════════════════════════════════
def home(request):
    categories = Category.objects.all()                     # Lấy tất cả thể loại từ database
    comics = Comic.objects.order_by('-updated_at')[:8]      # Lấy 8 truyện cập nhật mới nhất
    popular_comics = Comic.objects.order_by('-views')[:8]   # Lấy 8 truyện phổ biến nhất theo lượt xem
    
    # Chuẩn bị dữ liệu gửi sang template
    context = {
        'categories': categories,
        'comics': comics,
        'popular_comics': popular_comics
    }
    return render(request, 'core/home.html', context)       # Render template home.html với dữ liệu context

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: DANH SÁCH TRUYỆN (CÓ LỌC VÀ TÌM KIẾM)
#═══════════════════════════════════════════════════════════════════════════════
def comic_list(request):
    # Lấy tham số từ URL query string
    category_slug = request.GET.get('category') # Slug thể loại để lọc
    search_query = request.GET.get('search')    # Từ khóa tìm kiếm
    
    comics = Comic.objects.all()    # Lấy tất cả truyện từ database
    
    if category_slug:
        comics = comics.filter(categories__slug=category_slug) # Lọc theo slug thể loại
    
    if search_query:
        comics = comics.filter(     
            Q(title__icontains=search_query) |        # Tìm trong tiêu đề
            Q(author__icontains=search_query) |       # Tìm trong tác giả
            Q(description__icontains=search_query)    # Tìm trong mô tả
        )
    
    categories = Category.objects.all() # Lấy tất cả thể loại để hiển thị trong sidebar filter
    
    # Chuẩn bị dữ liệu gửi sang template
    context = {
        'comics': comics,
        'categories': categories,
        'selected_category': category_slug,      # Thể loại đã chọn
        'search_query': search_query,             # Từ khóa tìm kiếm
    }
    return render(request, 'core/comic_list.html', context) # Render template comic_list.html với dữ liệu context

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: CHI TIẾT TRUYỆN
#═══════════════════════════════════════════════════════════════════════════════
def comic_detail(request, comic_id):
    
    comic = get_object_or_404(Comic, id=comic_id)  # Lấy truyện từ database hoặc trả về 404 nếu không tồn tại
    chapters = comic.chapters.all().order_by('chapter_number') # Lấy tất cả chương của truyện, sắp xếp theo số chương
    
    # Tăng lượt xem lên 1
    comic.views += 1
    comic.save()
    
    is_favorite = False
    latest_read_chapter = None 
    
    if request.user.is_authenticated:               # Kiểm tra người dùng đã đăng nhập chưa
        # Kiểm tra truyện có trong danh sách yêu thích không
        is_favorite = Favorite.objects.filter(user=request.user, comic=comic).exists()
        
        # Lấy chương đọc gần nhất của người dùng
        latest_history = ReadingHistory.objects.filter(
            user=request.user, 
            comic=comic
        ).order_by('-read_at').first()
        if latest_history:
            latest_read_chapter = latest_history.chapter
    
    # Chuẩn bị dữ liệu gửi sang template
    context = {
        'comic': comic,
        'chapters': chapters,
        'is_favorite': is_favorite,
        'latest_read_chapter': latest_read_chapter,
    }
    return render(request, 'core/comic_detail.html', context) # Render template comic_detail.html với dữ liệu context

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: ĐỌC CHƯƠNG (CHỈ CHO NGƯỜI DÙNG ĐĂNG NHẬP)
#═══════════════════════════════════════════════════════════════════════════════
@login_required
def read_chapter(request, chapter_id):
    # Lấy chương từ database hoặc trả về 404 nếu không tồn tại
    chapter = get_object_or_404(
        Chapter.objects.select_related('comic'), 
        id=chapter_id
    )
    
    # Lấy tất cả trang hình ảnh của chương, sắp xếp theo số trang
    pages = chapter.pages.all().order_by('page_number')
    
    # Cập nhật hoặc tạo mới lịch sử đọc (atomic transaction để đảm bảo tính nhất quán)
    with transaction.atomic():
        ReadingHistory.objects.update_or_create(
            user=request.user,
            comic=chapter.comic,
            defaults={
                'chapter': chapter,
                'read_at': timezone.now()
            }
        )
    
    # Lấy tất cả chương của truyện (optimize: chỉ lấy các field cần thiết)
    chapters = Chapter.objects.filter(comic=chapter.comic).only('id', 'chapter_number')
    
    # Lấy chương trước (chương có số nhỏ hơn, lớn nhất)
    prev_chapter = chapters.filter(
        chapter_number__lt=chapter.chapter_number
    ).order_by('-chapter_number').first()
    
    # Lấy chương sau (chương có số lớn hơn, nhỏ nhất)
    next_chapter = chapters.filter(
        chapter_number__gt=chapter.chapter_number
    ).order_by('chapter_number').first()
    
    # Chuẩn bị dữ liệu gửi sang template
    context = {
        'chapter': chapter,
        'pages': pages,
        'prev_chapter': prev_chapter,
        'next_chapter': next_chapter,
    }
    
    return render(request, 'core/read_chapter.html', context)

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: CHUYỂN ĐỔI TRẠNG THÁI YÊU THÍCH (AJAX - CHỈ CHO NGƯỜI DÙNG ĐĂNG NHẬP)
#═══════════════════════════════════════════════════════════════════════════════
@login_required
def toggle_favorite(request, comic_id):
    comic = get_object_or_404(Comic, id=comic_id)   # Lấy truyện từ database hoặc trả về 404 nếu không tồn tại
    
    # Kiểm tra method là POST
    if request.method == 'POST':
        # get_or_create: Lấy hoặc tạo mới mục yêu thích
        # created: Boolean - True nếu vừa tạo mới, False nếu đã tồn tại
        favorite, created = Favorite.objects.get_or_create(
            user=request.user,
            comic=comic
        )
        
        # Kiểm tra nếu là AJAX request
        if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
            # Nếu đã tồn tại thì xóa mục yêu thích
            if not created:
                favorite.delete()
                return JsonResponse({
                    'status': 'removed', 
                    'message': f'Đã xóa {comic.title} khỏi danh sách yêu thích',
                    'favorite_count': comic.favorites.count()
                })
            # Nếu mới tạo thì trả về thành công
            else:
                return JsonResponse({
                    'status': 'added',
                    'message': f'Đã thêm {comic.title} vào danh sách yêu thích',
                    'favorite_count': comic.favorites.count()
                })
        # Nếu không phải AJAX, dùng form submission
        else:
            if not created:
                favorite.delete()
                messages.success(request, f'Đã xóa {comic.title} khỏi danh sách yêu thích')
            else:
                messages.success(request, f'Đã thêm {comic.title} vào danh sách yêu thích')
    
    return redirect('comic_detail', comic_id=comic_id) # Redirect về trang chi tiết truyện

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: LỊCH SỬ ĐỌC (CHỈ CHO NGƯỜI DÙNG ĐĂNG NHẬP)
#═══════════════════════════════════════════════════════════════════════════════
@login_required
def reading_history(request):
    # Lấy lịch sử đọc của người dùng hiện tại
    # select_related: Optimize query bằng cách join bảng comic và chapter
    history = ReadingHistory.objects.filter(
        user=request.user
    ).select_related(
        'comic', 'chapter'
    ).order_by('-read_at')  # Sắp xếp theo reat_at giảm dần (mới nhất trước)
    
    return render(request, 'core/reading_history.html', {'history': history}) # Render template core/reading_history.html với dữ liệu history

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: DANH SÁCH YÊU THÍCH (CHỈ CHO NGƯỜI DÙNG ĐĂNG NHẬP)
#═══════════════════════════════════════════════════════════════════════════════
@login_required
def favorites(request):
    # Lấy danh sách yêu thích của người dùng
    # select_related: Optimize query bằng cách join bảng comic
    favorite_comics = Favorite.objects.filter(
        user=request.user
    ).select_related('comic')
    
    return render(request, 'core/favorites.html', {'favorites': favorite_comics}) # Render template core/favorites.html với dữ liệu favorites

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: ĐĂNG KÝ TÀI KHOẢN MỚI
#═══════════════════════════════════════════════════════════════════════════════
def register(request):
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST) # Tạo form với dữ liệu từ POST request
        
        if form.is_valid():
            user = form.save()          # Lưu user mới vào database
            auth_login(request, user)   # Login tự động sau khi đăng ký
            messages.success(request, 'Đăng ký thành công!')    # Hiển thị thông báo thành công
            return redirect('home')     # Redirect về trang chủ
    else:
        form = UserRegistrationForm()   # Tạo form rỗng cho GET request

    return render(request, 'core/register.html', {'form': form}) # Render template register.html với form

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: ĐĂNG NHẬP
#═══════════════════════════════════════════════════════════════════════════════
def login_view(request):
    if request.method == 'POST':
        # Lấy username và password từ form
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        # Xác thực thông tin đăng nhập
        user = authenticate(request, username=username, password=password)
        
        # Kiểm tra xác thực thành công
        if user is not None:
            auth_login(request, user) # Đăng nhập user

            # Là admin,staff thì redirect về trang admin
            if user.is_superuser or user.is_staff:
                messages.success(request, f'Chào quản trị viên {user.username}!')
                return redirect('/admin/')
            # Nếu là user bình thường, redirect về home
            else:
                messages.success(request, f'Đăng nhập thành công! Xin chào {user.username}.')
                return redirect('home')
        else:
            messages.error(request, 'Sai tên đăng nhập hoặc mật khẩu.')
    
    # GET request hoặc POST thất bại: render template về trang login
    return render(request, 'core/login.html')

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: THÔNG TIN CÁ NHÂN (CHỈ CHO NGƯỜI DÙNG ĐĂNG NHẬP)
#═══════════════════════════════════════════════════════════════════════════════
@login_required
def profile(request):
    user = request.user        # Lấy user hiện tại
    favorites_count = Favorite.objects.filter(user=user).count()                # Đếm số truyện yêu thích
    reading_history_count = ReadingHistory.objects.filter(user=user).count()    # Đếm số truyện trong lịch sử đọc
    favorites = Favorite.objects.filter(user=request.user).select_related('comic') # Lấy danh sách yêu thích (optimize query)
    
    # Lấy lịch sử đọc (optimize query, sắp xếp mới nhất trước)
    reading_history = ReadingHistory.objects.filter(
        user=request.user
    ).select_related('chapter__comic').order_by('-read_at')
    
    # Chuẩn bị context
    context = {
        'user': user,
        'favorites': favorites,
        'favorite_count': favorites.count(),
        'reading_history': reading_history,
        'reading_count': reading_history.count(),
    }
    
    # Xử lý POST request: cập nhật thông tin
    if request.method == 'POST':
        # Cập nhật các field (nếu không gửi thì giữ nguyên)
        user.first_name = request.POST.get('first_name', user.first_name)
        user.last_name = request.POST.get('last_name', user.last_name)
        user.email = request.POST.get('email', user.email)
     
        user.save()   # Lưu vào database
        messages.success(request, 'Cập nhật thông tin thành công!')     # Hiển thị thông báo thành công
       
        return redirect('profile')      # Redirect về trang profile để refresh
    
    return render(request, 'users/profile.html', context)      # GET request: render template với thông tin hiện tại

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: TRANG GIỚI THIỆU
#═══════════════════════════════════════════════════════════════════════════════
def about(request):
    return render(request, 'users/about.html')

#═══════════════════════════════════════════════════════════════════════════════
# VIEW: ĐỌC TRUYỆN (CHỈ CHO NGƯỜI DÙNG ĐĂNG NHẬP)
#═══════════════════════════════════════════════════════════════════════════════
@login_required
def read(request, comic_id):
    comic = get_object_or_404(Comic, id=comic_id) # Lấy truyện từ database hoặc trả về 404 nếu không tồn tại
    chapters = comic.chapters.all().order_by('chapter_number') # Lấy tất cả chương, sắp xếp theo số chương
    
    # Kiểm tra truyện có trong danh sách yêu thích không
    is_favorite = False
    if request.user.is_authenticated:
        is_favorite = Favorite.objects.filter(user=request.user, comic=comic).exists()
    
    # Chuẩn bị dữ liệu
    context = {
        'comic': comic,
        'chapters': chapters,
        'is_favorite': is_favorite,
    }
    return render(request, 'core/read.html', context)