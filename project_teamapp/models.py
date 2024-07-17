from django.db import models

from django.db import models

class project_model(models.Model):
    username=models.CharField(max_length=150)
    email=models.EmailField(max_length=150,unique=True)
    password=models.CharField(max_length=150)
    phonenumber=models.PositiveBigIntegerField(null=True)
    gender=models.CharField(max_length=150, null=True)
    address=models.CharField(max_length=150, null=True)


class new_file(models.Model):
    PROJECT_TEAM_NAME = models.CharField(max_length=150)
    CHANGE_IN_PROJECT_SCOPE = models.CharField(max_length=150, unique=True)
    COMMUNICATION_BREAKDOWN=models.CharField(max_length=150)
    INADEQUATE=models.CharField(max_length=150,null=True)
    PLANNING=models.CharField(max_length=150, null=True)
    TEAM_MEMBER_PROCASTINATION=models.CharField(max_length=150, null=True)
    CLIENT_CHANGES_IN_PROJECT = models.CharField(max_length=150, null=True)
    EXTERNAL_CHANGES = models.CharField(max_length=150, null=True)
    # analyse=models.BooleanField(default=False)
    solutions = models.CharField(max_length=150, null=True)





class project_r1(models.Model):
    project_team_head = models.CharField(max_length=150)
    project_team_email = models.CharField(max_length=150, unique=True)
    android=models.CharField(max_length=150)
    total_team_members1 = models.CharField(max_length=150, null=True)
    frontend=models.CharField(max_length=150,null=True)
    total_team_members2 = models.CharField(max_length=150, null=True)
    backend=models.CharField(max_length=150, null=True)
    total_team_members3 = models.CharField(max_length=150, null=True)
    testing = models.CharField(max_length=150, null=True)
    total_team_members4 = models.CharField(max_length=150, null=True)
    others=models.CharField(max_length=150, null=True)
    total_team_members5 = models.CharField(max_length=150, null=True)
    project_enquiry = models.CharField(max_length=150, null=True)
    approve = models.BooleanField(default=False)
