from django.db import models


class client_details_send (models.Model):
    clientname = models.CharField(max_length=150)
    client_organisation_name = models.EmailField(max_length=150, unique=True)
    projectstatus = models.CharField(max_length=150)
    project_completion = models.CharField(max_length=150,null=True)
    payment_details = models.FileField(upload_to='payfiles')
    organisation_email=models.EmailField(null=True)