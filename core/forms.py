from django import forms  # Thư viện tạo form Django
from django.contrib.auth.models import User  # Model User từ Django
from django.contrib.auth.forms import UserCreationForm  # Form đăng ký người dùng
from .models import Category, Comic, Chapter, Page  # Import model từ app hiện tại
from django.core.exceptions import ValidationError  # Exception để xác thực dữ liệu

# Form đăng ký người dùng kế thừa từ UserCreationForm của Django
class UserRegistrationForm(UserCreationForm):
    """
    Form đăng ký tài khoản người dùng mới.
    
    Kế thừa từ UserCreationForm của Django và mở rộng thêm trường email.
    Bao gồm các trường: username, email, password1, password2 với xác thực dữ liệu.
    """
    email = forms.EmailField(
        required=True,  # Bắt buộc phải nhập
        widget=forms.EmailInput(attrs={
            'class': 'form-control',                # Class CSS từ Bootstrap cho styling
            'placeholder': 'Nhập địa chỉ email'     # Text gợi ý hiển thị trong ô input
        })
    )
    
    username = forms.CharField(
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Tên đăng nhập'
        })
    )
    
    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Mật khẩu'
        })
    )
    
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Xác nhận mật khẩu'
        })
    )

    class Meta:
        """
        Cấu hình các tham số cho form:
        - model: Model User mà form sẽ sử dụng
        - fields: Danh sách các trường sẽ hiển thị trên form
        """
        model = User  # Sử dụng model User của Django
        fields = ['username', 'email', 'password1', 'password2']  # Các trường hiển thị
        labels = {
            'username': 'Tên đăng nhập',
            'email': 'Địa chỉ email',
            'password1': 'Mật khẩu',
            'password2': 'Xác nhận mật khẩu',
        }
    
    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise ValidationError("Email này đã được sử dụng.")
        return email