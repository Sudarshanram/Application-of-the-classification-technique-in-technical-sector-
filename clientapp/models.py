from django.db import models


class client_model(models.Model):
    username = models.CharField(max_length=150)
    email = models.EmailField(max_length=150, unique=True)
    password = models.CharField(max_length=150)
    phonenumber = models.PositiveBigIntegerField(null=True)
    gender = models.CharField(max_length=150, null=True)
    address = models.CharField(max_length=150, null=True)
    actions= models.BooleanField(default=False)


class client_detail_model(models.Model):
    fullname = models.CharField(max_length=150)
    email = models.EmailField(max_length=150, unique=True)
    contact = models.PositiveBigIntegerField(null=True)
    organisation = models.CharField(max_length=150, null=True)
    gender = models.CharField(max_length=150, null=True)
    dob = models.CharField(max_length=150, null=True)
    country=models.CharField(max_length=150, null=True)
    files = models.ImageField(upload_to='files')
    approve = models.BooleanField(default=False)


class client_project_models(models.Model):
    organisation_name= models.CharField(max_length=150,null=True)
    organisation_address= models.CharField(max_length=150, unique=True)
    organisation_Email = models.EmailField(max_length=150, unique=True)
    phonenumber = models.PositiveBigIntegerField(null=True)
    services = models.CharField(max_length=150, null=True)
    p_enquiry = models.CharField(max_length=150, null=True)
    p_document = models.ImageField(upload_to='documents')
    approve=models.BooleanField(default=False)
    reject = models.BooleanField(default=False)

