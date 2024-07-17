from django.db import models

class technical_model(models.Model):
    username=models.CharField(max_length=150)
    email=models.EmailField(max_length=150,unique=True)
    password=models.CharField(max_length=150)
    phonenumber=models.PositiveBigIntegerField(null=True)
    gender=models.CharField(max_length=150, null=True)
    address=models.CharField(max_length=150, null=True)

class technical_team_details(models.Model):
    technicalteam_head_name=models.CharField(max_length=150)
    technicalteam_email=models.EmailField(max_length=150,unique=True)
    no_of_project_completed=models.CharField(max_length=150)
    current_project_details=models.CharField(max_length=150, null=True)
    no_of_workers=models.CharField(max_length=150, null=True)
    experienced=models.CharField(max_length=150, null=True)
    freshers=models.CharField(max_length=150, null=True)
    approve = models.BooleanField(default=False)