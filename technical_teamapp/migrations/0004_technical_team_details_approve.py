# Generated by Django 4.0.2 on 2022-08-20 09:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('technical_teamapp', '0003_alter_technical_team_details_current_project_details'),
    ]

    operations = [
        migrations.AddField(
            model_name='technical_team_details',
            name='approve',
            field=models.BooleanField(default=False),
        ),
    ]