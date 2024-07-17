from django.contrib import admin
from django.urls import path,include
from . import views
from django.conf.urls.static import static
from django.conf import settings
urlpatterns = [
    path('client_home/', views.home),
    path('client_index/', views.client_index),
    path('client_reg/', views.client_r),
    path('client_login/', views.login),
    # path('client_details/', views.client_details),
    path('client_details_form/', views.client_details_form),
    path('client_project_details/', views.client_project_details),
    path('client_approve/', views.client_approve),
    path('client_payment/', views.client_payment_detail),
    path('make_payment/', views.make_payment),
    # path('client_payment_button/', views.client_payment_button),
    path('logout/',views.logout)

]
urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)