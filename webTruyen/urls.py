from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')),
]

# Cấu hình để hiển thị file tĩnh (ảnh, CSS, JS) trong môi trường development
# Comment đoạn này nếu muốn test trang web không có CSS và hình ảnh
if settings.DEBUG:
    # Cho phép hiển thị file upload (ảnh truyện)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    # Cho phép hiển thị file CSS, JS
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)