# Generated by Django 4.0.7 on 2022-08-17 08:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_teamapp', '0003_project_r3_delete_project_r2'),
    ]

    operations = [
        migrations.CreateModel(
            name='project_r2',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project_team_head', models.CharField(max_length=150)),
                ('project_team_email', models.CharField(max_length=150, unique=True)),
                ('android', models.CharField(max_length=150)),
                ('frontend', models.CharField(max_length=150, null=True)),
                ('total_team_members1', models.CharField(max_length=150, null=True)),
                ('backend', models.CharField(max_length=150, null=True)),
                ('others', models.CharField(max_length=150, null=True)),
                ('total_team_members2', models.CharField(max_length=150, null=True)),
                ('testing', models.CharField(max_length=150, null=True)),
                ('total_team_members3', models.CharField(max_length=150, null=True)),
                ('total_team_members4', models.CharField(max_length=150, null=True)),
                ('project_enquiry', models.CharField(max_length=150, null=True)),
            ],
        ),
        migrations.DeleteModel(
            name='project_r3',
        ),
    ]