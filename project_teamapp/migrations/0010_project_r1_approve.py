# Generated by Django 4.0.2 on 2022-08-20 09:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_teamapp', '0009_new_file_solutions'),
    ]

    operations = [
        migrations.AddField(
            model_name='project_r1',
            name='approve',
            field=models.BooleanField(default=False),
        ),
    ]