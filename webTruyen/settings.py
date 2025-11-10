import os
from pathlib import Path

#═══════════════════════════════════════════════════════════════════════════════
# CÁC CẤU HÌNH CƠ BẢN
#═══════════════════════════════════════════════════════════════════════════════
BASE_DIR = Path(__file__).resolve().parent.parent
SECRET_KEY = "django-insecure-ce^kt@gu34vw8%gj-iy33uekvk+@mv%*(0gcy@w$@d1l5b7k41"
DEBUG = True
ALLOWED_HOSTS = []
#═══════════════════════════════════════════════════════════════════════════════
# CẤU HÌNH ỨNG DỤNG VÀ MIDDLEWARE
#═══════════════════════════════════════════════════════════════════════════════
INSTALLED_APPS = [
    # Các ứng dụng mặc định của Django
    "django.contrib.admin",      # Trang quản trị
    "django.contrib.auth",       # Hệ thống xác thực người dùng
    "django.contrib.contenttypes", # Quản lý các loại nội dung
    "django.contrib.sessions",   # Quản lý phiên làm việc
    "django.contrib.messages",   # Hệ thống thông báo
    "django.contrib.staticfiles", # Quản lý file tĩnh
    
    # Ứng dụng tự tạo
    "core",                     # Ứng dụng chính của website truyện
]

# Danh sách Middleware - xử lý request/response
MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

#═══════════════════════════════════════════════════════════════════════════════
# CẤU HÌNH URLS VÀ TEMPLATES
#═══════════════════════════════════════════════════════════════════════════════

# File cấu hình URL gốc của dự án
ROOT_URLCONF = "webTruyen.urls"

# Cấu hình hệ thống template
TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [os.path.join(BASE_DIR, "core", "templates")],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

# Cấu hình WSGI application
WSGI_APPLICATION = "webTruyen.wsgi.application"

#═══════════════════════════════════════════════════════════════════════════════
# CẤU HÌNH Database VÀ BẢO MẬT
#═══════════════════════════════════════════════════════════════════════════════

# Cấu hình kết nối cơ sở dữ liệu MySQL
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'webtruyen_db',
        'USER': 'root',
        'PASSWORD': '123456',
        'HOST': 'localhost', 
        'PORT': '3306', 
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        }
    }
}

# Cấu hình bảo mật mật khẩu
# AUTH_PASSWORD_VALIDATORS = [
#     {
#         "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
#     },
#     {
#         "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
#     },
#     {
#         "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
#     },
#     {
#         "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
#     },
# ]

# Tắt bảo mật mật khẩu trong giai đoạn phát triển
AUTH_PASSWORD_VALIDATORS = []

LANGUAGE_CODE = 'vi'
TIME_ZONE = 'Asia/Ho_Chi_Minh'
USE_I18N = True
USE_TZ = True

#═══════════════════════════════════════════════════════════════════════════════
# CẤU HÌNH FILE STATIC VÀ MEDIA
#═══════════════════════════════════════════════════════════════════════════════

# URL prefix cho các file tĩnh (CSS, JavaScript, Images)
STATIC_URL = '/static/'
# Danh sách các thư mục chứa file tĩnh
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'core', 'static')]
# Thư mục chứa các file tĩnh sau khi chạy collectstatic
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

# URL prefix cho các file media (upload bởi người dùng)
MEDIA_URL = '/media/'
# Thư mục lưu trữ file media
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Loại trường ID mặc định cho các model
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# Url chuyển hướng sau khi đăng nhập/đăng xuất
LOGIN_REDIRECT_URL = 'home'  
LOGOUT_REDIRECT_URL = 'home' 