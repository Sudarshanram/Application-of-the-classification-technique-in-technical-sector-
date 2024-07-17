from django.shortcuts import render
from django.contrib import messages
from clientapp.models import *
from managerapp.models import *
from project_teamapp.views import *
from technical_teamapp.models import *
from project_teamapp.models import *
from django.core.mail import send_mail

from django.shortcuts import render,redirect


def manager(request):
    return render(request, 'manager/manager.html')

#
# def manager_homepage(request):
#     return render(request, 'manager/manager_homepage.html')


def manager_index(request):
    return render(request, 'manager/manager_index.html')


def manager_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        if username == "admin@gmail.com" and password == "admin":
            request.session['manager'] = 'admin@gmail.com'
            messages.info(request, "successfully login")
            return redirect('/manager_index/')
        elif username != "admin@gmail.com":
            messages.error(request, "Wrong Admin Email")
            return redirect('/manager_login/')
        elif password != "admin":
            messages.error(request, "Wrong Admin Password")
            return render(request, 'manager/manager_index.html')
    return render(request, 'manager/manager.html')


def manager_customer_table(request):
    datas=client_detail_model.objects.filter(approve=False)
    return render(request,'manager/manager_customer_table.html',{'datas': datas})

def project_t_view(request):
    datas=project_r1.objects.filter(approve=False)
    return render(request,'manager/project_team_view_table.html',{'datas': datas})

def technical_t_view(request):
    datas=technical_team_details.objects.filter(approve=False)
    return render(request,'manager/technical_team_view_table.html',{'datas': datas})


def manager_client_project_table(request):
    datas = project_r1.objects.all()
    return render(request, 'manager/manager_c_project_table.html', {'datas': datas})




def manager_approve(request):
    # if 'manager' in request.session:
    datas= client_project_models.objects.filter(approve=False)
    return render(request,'manager/manager_c_project_table.html', {'datas': datas})



def send_client(request,id):
    datas = client_project_models.objects.get(id=id)
    datas.approve=True
    datas.save()
    print('hi')
    messages.info(request, "client project approved")
    return redirect('/manager_approve/')


def manager_send_client_details(request):
    return render(request, 'manager/manager_send_client_details.html')

def send_client_details(request):
    if request.method == 'POST':
        clientname = request.POST['clientname']
        client_organisation_name = request.POST['client_organisation_name']
        projectstatus = request.POST['projectstatus']
        organisation_email = request.POST['organisation_email']
        project_completion = request.POST['project_completion']
        payment_details= request.FILES['payment_details']
        client_details_send(clientname=clientname,organisation_email=organisation_email,
                            client_organisation_name=client_organisation_name, projectstatus=projectstatus,
                            project_completion=project_completion, payment_details=payment_details).save()
        messages.info(request, "successfully send to client")
        return redirect('/manager_index/')
    return render(request,  'manager/manager_send_client_details.html')


# def accept_project(request,id):
#     datas = client_project_models.objects.get(id=id)
#     send_mail(
#         'Subject here',
#         'Sorry Your registration with us is declined from our Organization...',
#         'karthick@gmail.com',
#         [datas.email],
#         fail_silently=False,
#     )
def managerlogout(request):
    if 'manager' in request.session:
        request.session.pop('manager',None)
        messages.success(request,'logout already successfully')
        return redirect('/')
    else:
        messages.success(request, 'session logged out')
        return redirect('/managerlogout')

def manager_reject(request):
    datas = client_project_models.objects.get(id=id)
    datas.approve = True
    datas.save()
    print('hi')
    messages.info(request, "projected rejected")
    return redirect('/manager_approve/')

def customer_view(request,id):
    datas = client_detail_model.objects.get(id=id)
    if datas.approve==False:
        datas.approve = True
        datas.save()
        print('hi')
        messages.info(request, "verified successfully")
    return redirect('/manager_customer_table/')


def project_view(request,id):
    datas = project_r1.objects.get(id=id)
    if datas.approve == False:
        datas.approve = True
        datas.save()
        print('hi')
        messages.info(request, "report send to technical team")
    return redirect('/project_t_view/')



def technical_view(request,id):
    datas = technical_team_details.objects.get(id=id)
    if datas.approve == False:
        datas.approve = True
        datas.save()
        print('hi')
        messages.info(request, "verified successfully")
    return redirect('/technical_t_view/')
