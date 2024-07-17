from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib import messages
from .models import *
import os
import mimetypes
from managerapp.models import *


def client_index(request):
    return render(request, 'client/client_home.html')


def home(request):
    return render(request, 'client/client_login_register.html')


def client_r(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        phonenumber = request.POST['phonenumber']
        gender = request.POST['gender']
        address = request.POST['address']
        client_model(username=username, email=email, password=password, phonenumber=phonenumber, gender=gender,
                     address=address).save()
        messages.info(request, "successfully registered")
        return redirect('/client_login/')
    return render(request, 'client/client_login_register.html')


def login(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']


        try:
            emp= client_model.objects.get(email=email, password=password)
            request.session['user'] = emp.email

            messages.info(request, "successfully login")

            return render(request, 'client/client_home.html')
        except:
            messages.info(request, "Wrong Credentials")
    return render(request, 'client/client_login_register.html')


#
# def client_details (request):
#     return render(request, 'client/client_details.html')
#
#
# def client_deta (request):
#     return render(request, 'client/client_details.html')

def client_details_form(request):
    if request.method == 'POST':
        fullname = request.POST['fullname']
        email = request.POST['email']
        contact = request.POST['contact']
        organisation = request.POST['organisation']
        gender = request.POST['gender']
        dob = request.POST['dob']
        country=request.POST['country']
        files = request.FILES['files']
        client_detail_model(fullname=fullname, email=email, contact=contact, organisation=organisation, gender=gender,
                            dob=dob, country=country, files=files).save()
        messages.info(request, "successfully sent to manager")
        return redirect('/client_project_details/')
    return render(request, 'client/client_details.html')


def client_project_details(request):
    if request.method == 'POST':
        organisation_name = request.POST['organisation_name']
        organisation_address = request.POST['organisation_address']
        organisation_Email=request.POST['organisation_Email']
        phonenumber = request.POST['phonenumber']
        services = request.POST['services']
        p_enquiry = request.POST['p_enquiry']
        p_document = request.FILES['p_document']
        client_project_models(organisation_name=organisation_name, organisation_address=organisation_address,
                            services=services, organisation_Email=organisation_Email,
                            phonenumber=phonenumber,  p_enquiry=p_enquiry,
                            p_document=p_document).save()
        messages.info(request, "successfully sent to manager for approval")
        return redirect('/client_project_details/')
    return render(request, 'client/client_project_details.html')


def client_approve(request):
    datas =client_details_send.objects.all()
    return render(request, 'client/client_table_view.html', {'datas': datas})

# def client_payment_button(request):
#     datas = client_details_send.objects.filter(approve=True)
#     return render(request, 'client/client_table_view.html', {'datas': datas})



def client_payment_detail(request):
   return render(request, 'client/client_payment.html')

def make_payment(request):
    messages.error(request, "PAYMENT SUCCESSFULL")
    return render(request, 'client/client_home.html')


def logout(request):
    if 'user' in request.session:
        request.session.pop('user',None)
        messages.info(request,'logout already successfully')
        return redirect('/')
    else:
        messages.info(request, 'session logged out')
        return redirect('/logout')



def download_file(request, path):
    # Define Django project base directory
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    # Define text file name
    filename = 'test.txt'
    # Define the full file path
    filepath = BASE_DIR + '/downloadapp/Files/' + filename
    # Open the file for reading content
    path = open(filepath, 'r')
    # Set the mime type
    mime_type, _ = mimetypes.guess_type(filepath)
    # Set the return value of the HttpResponse
    response = HttpResponse(path, content_type=mime_type)
    # Set the HTTP header for sending to browser
    response['Content-Disposition'] = "attachment; filename=%s" % filename
    # Return the response value
    return response