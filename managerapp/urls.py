from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    path('manager/', views.manager),
    path('manager_login/', views.manager_login),
    # path('demo/', views.demo),
    # path('manager_homepage/', views.manager_homepage),
    path('manager_index/', views.manager_index),
    path('manager_customer_table/', views.manager_customer_table),
    path('manager_client_project_table/', views.manager_client_project_table),
    path('manager_approve/', views.manager_approve),
    path('manager_reject/', views.manager_reject),
    path('manager_customer_view/<int:id>/', views.customer_view),
    path('project_t_view/', views.project_t_view),
    path('technical_t_view/', views.technical_t_view),
    path('send_client/<int:id>/', views.send_client),
    path('manager_send_client_details/', views.manager_send_client_details),
    path('send_client_details/', views.send_client_details),
    path('managerlogout/', views.managerlogout),
    path('project_view/<int:id>/', views.project_view),
    path('technical_view/<int:id>/', views.technical_view),
]
