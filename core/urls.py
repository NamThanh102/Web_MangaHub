from django.conf import settings
from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
from django.conf.urls.static import static

urlpatterns = [
    path('', views.home, name='home'),
    path('comics/', views.comic_list, name='comic_list'),
    path('register/', views.register, name='register'),
    path('login/', views.login_view, name='login_view'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    
    # User URLs
    path('register/', views.register, name='register'),
    path('profile/', views.profile, name='profile'),
    path('about/', views.about, name='about'),  

    # Comic URLs
    path('comic/<int:comic_id>/', views.comic_detail, name='comic_detail'),
    path('chapter/<int:chapter_id>/', views.read_chapter, name='read_chapter'),
    path('toggle_favorite/<int:comic_id>/', views.toggle_favorite, name='toggle_favorite'),
    path('favorites/', views.favorites, name='favorites'),
    path('history/', views.reading_history, name='reading_history'),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)