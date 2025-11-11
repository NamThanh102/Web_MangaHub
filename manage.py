import os
import sys

def main():
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "webTruyen.settings")
    try:
        from django.core.management import execute_from_command_line
    except ImportError as e:
        raise ImportError(
            "Không thể import Django. Hãy kiểm tra:\n"
            "1. Django đã được cài đặt chưa?\n"
            "2. Biến môi trường PYTHONPATH đã được cấu hình đúng chưa?\n"
            "3. Môi trường ảo (virtual environment) đã được kích hoạt chưa?"
        ) from e
    execute_from_command_line(sys.argv)

if __name__ == "__main__":
    main()
