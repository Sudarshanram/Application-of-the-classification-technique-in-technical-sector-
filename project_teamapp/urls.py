from django.contrib import admin
from django.urls import path,include
from . import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('project_index/', views.project_index),
    path('project_lr/', views.project_lr),
    path('project_r/', views.project_r),
    path('project_l/', views.project_l),
    path('client_project_view/', views.client_project_view),
    path('project_team_client_view/', views.project_team_client_view),
    path('project_upload_team_report/', views.project_upload_team_report),
    path('project_team_upload1/', views.project_team_upload1),
    path('project_team_logout/', views.project_team_logout),
    path('client_view/<int:id>/', views.client_view),

]
urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)