import core.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("core", "0003_alter_page_unique_together"),
    ]

    operations = [
        migrations.AlterField(
            model_name="page",
            name="image",
            field=models.ImageField(
                upload_to=core.models.page_upload_to, verbose_name="Trang truyện"
            ),
        ),
    ]
