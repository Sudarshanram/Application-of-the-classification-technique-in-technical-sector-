from django.shortcuts import render, redirect
from django.http import HttpResponse
# from .models import *
from .models import project_model
from clientapp.models import *
from project_teamapp.models import *
from django.contrib import messages


def project_index(request):
    return render(request, 'project_team/project_team_index.html')


def project_lr(request):
    return render(request, 'project_team/project_team_login_register.html')


def project_r(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        phonenumber = request.POST['phonenumber']
        gender = request.POST['gender']
        address = request.POST['address']
        project_model(username=username, email=email, password=password, phonenumber=phonenumber, gender=gender,
                      address=address).save()
        messages.info(request, "successfully registered")
        return redirect('/project_l/')
    return render(request, 'project_team_login_register.html')


def project_l(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']

        try:
            project = project_model.objects.get(email=email, password=password)
            request.session['project'] = project.email
            messages.info(request, "successfully login")

            return render(request, 'project_team/project_team_index.html')
        except:
            pass
    return render(request, 'project_team/project_team_login_register.html')


def client_project_view(request):
    return render(request, 'project_team/project_team_client_p.html')


def project_team_client_view(request):
    datas = client_project_models.objects.filter(approve=True)
    return render(request, 'project_team/project_team_client_p.html', {'datas': datas})


def project_team_report(request):
    return render(request, 'project_team/project_report.html')


# def project_team_upload(request):
#     return render(request, 'project_team/project_team_upload.html')

def project_team_upload1(request):
    if request.method == 'POST':
        PROJECT_TEAM_NAME = request.POST['PROJECT_TEAM_NAME']
        CHANGE_IN_PROJECT_SCOPE = request.POST['CHANGE_IN_PROJECT_SCOPE']
        COMMUNICATION_BREAKDOWN = request.POST['COMMUNICATION_BREAKDOWN']
        INADEQUATE = request.POST['INADEQUATE']
        PLANNING = request.POST['PLANNING']
        TEAM_MEMBER_PROCASTINATION = request.POST['TEAM_MEMBER_PROCASTINATION']
        CLIENT_CHANGES_IN_PROJECT = request.POST['CLIENT_CHANGES_IN_PROJECT']
        EXTERNAL_CHANGES = request.POST['EXTERNAL_CHANGES']
        new_file(PROJECT_TEAM_NAME=PROJECT_TEAM_NAME, CHANGE_IN_PROJECT_SCOPE=CHANGE_IN_PROJECT_SCOPE,
                 COMMUNICATION_BREAKDOWN=COMMUNICATION_BREAKDOWN, INADEQUATE=INADEQUATE, PLANNING=PLANNING,
                 TEAM_MEMBER_PROCASTINATION=TEAM_MEMBER_PROCASTINATION,
                 CLIENT_CHANGES_IN_PROJECT=CLIENT_CHANGES_IN_PROJECT, EXTERNAL_CHANGES=EXTERNAL_CHANGES).save()
        messages.info(request, "successfully sent to technical team")
        return redirect('/project_index/')
    return render(request, 'project_team/project_team_upload.html')


def project_upload_team_report(request):
    if request.method == 'POST':
        project_team_head = request.POST['project_team_head']
        project_team_email = request.POST['project_team_email']
        android = request.POST['android']
        frontend = request.POST['frontend']
        total_team1 = request.POST['total_team_members1']
        backend = request.POST['backend']
        total_team_members2 = request.POST['total_team_members2']
        testing = request.POST['testing']
        total_team_members3 = request.POST['total_team_members3']
        total_team_members4 = request.POST['total_team_members4']
        total_team_members5 = request.POST['total_team_members5']
        project_enquiry = request.POST['project_enquiry']
        others = request.POST['others']
        project_r1(project_team_head=project_team_head, project_team_email=project_team_email, android=android,
                   frontend=frontend, total_team_members1=total_team1,
                   backend=backend, total_team_members2=total_team_members2, testing=testing,
                   total_team_members3=total_team_members3, project_enquiry=project_enquiry,
                   total_team_members4=total_team_members4, others=others,
                   total_team_members5=total_team_members5).save()
        messages.info(request, "successfully sent to manager")
        return redirect('/project_index/')
    return render(request, 'project_team/project_report.html')


def project_team_logout(request):
    if 'project' in request.session:
        request.session.pop('project', None)
        messages.success(request, 'logout already successfully')
        return redirect('/')
    else:
        messages.success(request, 'session logged out')
        return redirect('/project_team_logout')


def client_view(request, id):
    datas = client_project_models.objects.get(id=id)
    if datas.approve == False:
        datas.approve = True
        datas.save()
        print('hi')
        messages.info(request, "successfully sent")
    return redirect('/project_team_client_view/')
