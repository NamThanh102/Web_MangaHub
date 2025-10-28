from django.db.models.deletion import CASCADE
from django.conf import settings
from django.db import migrations, models

class Migration(migrations.Migration):
    initial = True
    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]
    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='Tên thể loại')),
                ('description', models.TextField(blank=True, verbose_name='Mô tả')),
            ],
            options={
                'verbose_name': 'Thể loại',
                'verbose_name_plural': 'Thể loại',
            },
        ),
        migrations.CreateModel(
            name='Comic',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Tiêu đề')),
                ('author', models.CharField(max_length=100, verbose_name='Tác giả')),
                ('description', models.TextField(verbose_name='Mô tả')),
                ('cover_image', models.ImageField(upload_to='comic_covers/', verbose_name='Ảnh bìa')),
                ('status', models.CharField(choices=[('ongoing', 'Đang tiến hành'), ('completed', 'Đã hoàn thành'), ('hiatus', 'Tạm ngưng')], default='ongoing', max_length=20, verbose_name='Trạng thái')),
                ('views', models.PositiveIntegerField(default=0, verbose_name='Lượt xem')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('categories', models.ManyToManyField(to='core.category', verbose_name='Thể loại')),
            ],
            options={
                'verbose_name': 'Truyện tranh',
                'verbose_name_plural': 'Truyện tranh',
            },
        ),
        migrations.CreateModel(
            name='Chapter',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='Tiêu đề chương')),
                ('chapter_number', models.IntegerField(verbose_name='Số chương')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('comic', models.ForeignKey(on_delete=CASCADE, related_name='chapters', to='core.comic', verbose_name='Truyện')),
            ],
            options={
                'verbose_name': 'Chương',
                'verbose_name_plural': 'Chương',
                'ordering': ['chapter_number'],
            },
        ),
        migrations.CreateModel(
            name='Page',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='chapter_pages/', verbose_name='Trang truyện')),
                ('page_number', models.IntegerField(verbose_name='Số trang')),
                ('chapter', models.ForeignKey(on_delete=CASCADE, related_name='pages', to='core.chapter', verbose_name='Chương')),
            ],
            options={
                'verbose_name': 'Trang',
                'verbose_name_plural': 'Trang',
                'ordering': ['page_number'],
            },
        ),
        migrations.CreateModel(
            name='Favorite',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('added_at', models.DateTimeField(auto_now_add=True)),
                ('comic', models.ForeignKey(on_delete=CASCADE, to='core.comic', verbose_name='Truyện')),
                ('user', models.ForeignKey(on_delete=CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Người dùng')),
            ],
            options={
                'verbose_name': 'Yêu thích',
                'verbose_name_plural': 'Yêu thích',
                'unique_together': {('user', 'comic')},
            },
        ),
        migrations.CreateModel(
            name='ReadingHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('read_at', models.DateTimeField(auto_now_add=True)),
                ('chapter', models.ForeignKey(on_delete=CASCADE, to='core.chapter', verbose_name='Chương')),
                ('comic', models.ForeignKey(on_delete=CASCADE, to='core.comic', verbose_name='Truyện')),
                ('user', models.ForeignKey(on_delete=CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Người dùng')),
            ],
            options={
                'verbose_name': 'Lịch sử đọc',
                'verbose_name_plural': 'Lịch sử đọc',
                'ordering': ['-read_at'],
                'unique_together': {('user', 'comic', 'chapter')},
            },
        ),
    ]
