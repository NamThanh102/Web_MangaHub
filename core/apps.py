from django.apps import AppConfig  # Thư viện cấu hình ứng dụng Django

class CoreConfig(AppConfig):
    # BigAutoField: Tự động tăng từ 1 đến 9223372036854775807 (64-bit)
    default_auto_field = "django.db.models.BigAutoField"
    name = "core"
    verbose_name = 'Quản lý Truyện tranh'
