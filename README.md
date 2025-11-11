# tạo môi trường ảo env
python -m venv env
env\Scripts\activate

# tải lib cần dùng
pip install -r requirements.txt

# check settings.py rồi vào mysql workbench import file.sql
# sau đó chạy các lệnh:
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser

# RUN
python manage.py runserver



