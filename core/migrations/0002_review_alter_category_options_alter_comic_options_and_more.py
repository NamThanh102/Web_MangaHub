from django.db.models.deletion import CASCADE
import django.utils.timezone
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rating', models.PositiveSmallIntegerField(choices=[(1, '1 Sao'), (2, '2 Sao'), (3, '3 Sao'), (4, '4 Sao'), (5, '5 Sao')], verbose_name='Đánh giá')),
                ('comment', models.TextField(blank=True, verbose_name='Bình luận')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'Đánh giá',
                'verbose_name_plural': 'Đánh giá',
                'ordering': ['-created_at'],
            },
        ),
        migrations.AlterModelOptions(
            name='category',
            options={'ordering': ['name'], 'verbose_name': 'Thể loại', 'verbose_name_plural': 'Thể loại'},
        ),
        migrations.AlterModelOptions(
            name='comic',
            options={'ordering': ['-created_at'], 'verbose_name': 'Truyện tranh', 'verbose_name_plural': 'Truyện tranh'},
        ),
        migrations.AlterModelOptions(
            name='favorite',
            options={'ordering': ['-added_at'], 'verbose_name': 'Yêu thích', 'verbose_name_plural': 'Yêu thích'},
        ),
        migrations.AlterUniqueTogether(
            name='readinghistory',
            unique_together=set(),
        ),
        migrations.AddField(
            model_name='category',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='category',
            name='slug',
            field=models.SlugField(blank=True, unique=True, verbose_name='Slug'),
        ),
        migrations.AddField(
            model_name='chapter',
            name='slug',
            field=models.SlugField(blank=True, verbose_name='Slug'),
        ),
        migrations.AddField(
            model_name='comic',
            name='slug',
            field=models.SlugField(blank=True, unique=True, verbose_name='Slug'),
        ),
        migrations.AddField(
            model_name='readinghistory',
            name='page_number',
            field=models.PositiveIntegerField(default=1, verbose_name='Trang hiện tại'),
        ),
        migrations.AlterField(
            model_name='chapter',
            name='chapter_number',
            field=models.DecimalField(decimal_places=2, max_digits=10, verbose_name='Số chương'),
        ),
        migrations.AlterField(
            model_name='comic',
            name='categories',
            field=models.ManyToManyField(related_name='comics', to='core.category', verbose_name='Thể loại'),
        ),
        migrations.AlterField(
            model_name='favorite',
            name='comic',
            field=models.ForeignKey(on_delete=CASCADE, related_name='favorites', to='core.comic', verbose_name='Truyện'),
        ),
        migrations.AlterField(
            model_name='favorite',
            name='user',
            field=models.ForeignKey(on_delete=CASCADE, related_name='favorites', to=settings.AUTH_USER_MODEL, verbose_name='Người dùng'),
        ),
        migrations.AlterField(
            model_name='page',
            name='page_number',
            field=models.PositiveIntegerField(verbose_name='Số trang'),
        ),
        migrations.AlterField(
            model_name='readinghistory',
            name='comic',
            field=models.ForeignKey(on_delete=CASCADE, related_name='reading_history', to='core.comic', verbose_name='Truyện'),
        ),
        migrations.AlterField(
            model_name='readinghistory',
            name='read_at',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='readinghistory',
            name='user',
            field=models.ForeignKey(on_delete=CASCADE, related_name='reading_history', to=settings.AUTH_USER_MODEL, verbose_name='Người dùng'),
        ),
        migrations.AlterUniqueTogether(
            name='chapter',
            unique_together={('comic', 'chapter_number')},
        ),
        migrations.AlterUniqueTogether(
            name='page',
            unique_together={('chapter', 'page_number')},
        ),
        migrations.AlterUniqueTogether(
            name='readinghistory',
            unique_together={('user', 'comic')},
        ),
        migrations.AddIndex(
            model_name='chapter',
            index=models.Index(fields=['comic', 'chapter_number'], name='core_chap_comic_i_8371f8_idx'),
        ),
        migrations.AddIndex(
            model_name='comic',
            index=models.Index(fields=['-created_at'], name='core_comi_created_83545c_idx'),
        ),
        migrations.AddIndex(
            model_name='comic',
            index=models.Index(fields=['status'], name='core_comi_status_a71a98_idx'),
        ),
        migrations.AddIndex(
            model_name='readinghistory',
            index=models.Index(fields=['user', '-read_at'], name='core_read_user_id_4d0347_idx'),
        ),
        migrations.AddField(
            model_name='review',
            name='comic',
            field=models.ForeignKey(on_delete=CASCADE, related_name='reviews', to='core.comic', verbose_name='Truyện'),
        ),
        migrations.AddField(
            model_name='review',
            name='user',
            field=models.ForeignKey(on_delete=CASCADE, related_name='reviews', to=settings.AUTH_USER_MODEL, verbose_name='Người dùng'),
        ),
        migrations.AlterUniqueTogether(
            name='review',
            unique_together={('user', 'comic')},
        ),
    ]
