from django.contrib import admin
from django.urls import path,include
from . import views
from .models import *

urlpatterns = [
    path('technical_index/', views.technical_index),
    path('technical_home/', views.technical_home),
    path('technical_lr/', views.technical_lr),
    path('technical_r/', views.technical_r),
    path('technical_team_l/', views.technical_team_l),
    path('technical_team_detail/', views.technical_team_detail),
    path('project_team_table/', views.project_team_table),
    path('technical_team_logout/', views.technical_team_logout),
    path('get_input/<int:id>/', views.get_input),
    path('view', views.view),
    path('project_team_output/', views.project_team_output),
    # path('output_analyse', views.output_analyse),
# path('project_login/', views.project_login),
#     path('client_reg/', views.client_r),
#     path('client_login/', views.login),
]
