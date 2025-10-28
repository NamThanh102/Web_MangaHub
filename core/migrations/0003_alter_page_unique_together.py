from django.db import migrations

class Migration(migrations.Migration):
    dependencies = [
        ('core', '0002_review_alter_category_options_alter_comic_options_and_more'),
    ]
    operations = [
        migrations.AlterUniqueTogether(
            name='page',
            unique_together=set(),
        ),
    ]
