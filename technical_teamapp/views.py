from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import *
from project_teamapp.models import *
from django.contrib import messages
import numpy as np
import pandas as pd
import warnings
warnings.filterwarnings('ignore')
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import GradientBoostingClassifier
df = pd.DataFrame(pd.read_excel("sample.xlsx"))
read_file = pd.read_excel("sample.xlsx")
read_file.to_csv("sample.csv", header=True, index=False)
x = pd.read_csv("sample.csv")


def technical_index(request):
    return render(request, 'client/client_home.html')


def technical_home(request):
    return render(request, 'technical_team/technical_team_home.html')


def technical_lr(request):
    return render(request, 'technical_team/technical_team_lr.html')


def technical_r(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        phonenumber = request.POST['phonenumber']
        gender = request.POST['gender']
        address = request.POST['address']
        technical_model(username=username, email=email, password=password, phonenumber=phonenumber, gender=gender,
                        address=address).save()
        messages.info(request, "successfully registered")
        return redirect('/technical_home/')
    return render(request, 'technical/technical_lr.html')


def technical_team_l(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        try:
            tech = technical_model.objects.get(email=email, password=password)
            messages.info(request, "successfully login")
            request.session['team'] = tech.email

            return redirect('/technical_home/')
        except:
            pass
    return render(request, 'technical_team/technical_team_lr.html')


def technical_team_detail(request):
    if request.method == 'POST':
        technicalteam_head_name = request.POST['technicalteam_head_name']
        technicalteam_email = request.POST['technicalteam_email']
        no_of_project_completed = request.POST['no_of_project_completed']
        current_project_details = request.POST['current_project_details']
        no_of_workers = request.POST['no_of_workers']
        experienced = request.POST['experienced']
        freshers = request.POST['freshers']
        technical_team_details(technicalteam_head_name=technicalteam_head_name, technicalteam_email=technicalteam_email,
                        no_of_project_completed=no_of_project_completed,
                        current_project_details=current_project_details, no_of_workers=no_of_workers,
                        experienced=experienced, freshers=freshers).save()
        messages.success(request, 'successfully sent to manager')
        return redirect('/technical_home/')
    return render(request, 'technical_team/technical_team__details.html')


def project_team_table(request):
    datas=new_file.objects.all()
    return render(request,'technical_team/project_team_table.html',{'datas': datas})



def algo(datas,r):
    data = pd.read_csv('sample.csv')
    data_x = data.iloc[:, :-1]
    data_y = data.iloc[:, -1]
    string_datas = [i for i in data_x.columns if data_x.dtypes[i] == np.object_]

    LabelEncoders = []
    for i in string_datas:
        newLabelEncoder = LabelEncoder()
        data_x[i] = newLabelEncoder.fit_transform(data_x[i])
        LabelEncoders.append(newLabelEncoder)
    ylabel_encoder = None
    if type(data_y.iloc[1]) == str:
        ylabel_encoder = LabelEncoder()
        data_y = ylabel_encoder.fit_transform(data_y)

    model = GradientBoostingClassifier()
    model.fit(data_x, data_y)

    value = {data_x.columns[i]: datas[i] for i in range(len(datas))}
    l = 0
    for i in string_datas:
        z = LabelEncoders[l]
        value[i] = z.transform([value[i]])[0]
        l += 1
    value = [i for i in value.values()]
    predicted = model.predict([value])
    print(12334455)
    if ylabel_encoder:
        predicted = ylabel_encoder.inverse_transform(predicted)
    return predicted[0]

def view(request):
    datas = new_file.objects.filter(solutions__isnull=True)
    if 'team' in request.session:
        datas = new_file.objects.filter(solutions__isnull=True)
        return render(request, 'technical_team/project_team_table.html', {'datas':datas})



def get_input(request, id):
    # if 'user' in request.session:
    get = new_file.objects.get(id=id)
    r=get.id
    inputvar = []
    get.save()
    PROJECT_TEAM_NAME= get.PROJECT_TEAM_NAME
    CHANGE_IN_PROJECT_SCOPE= get.CHANGE_IN_PROJECT_SCOPE
    COMMUNICATION_BREAKDOWN= get.COMMUNICATION_BREAKDOWN
    INADEQUATE=get.INADEQUATE
    PLANNING= get.PLANNING
    TEAM_MEMBER_PROCASTINATION= get.TEAM_MEMBER_PROCASTINATION
    CLIENT_CHANGES_IN_PROJECT = get.CLIENT_CHANGES_IN_PROJECT
    EXTERNAL_CHANGES = get.EXTERNAL_CHANGES




    inputvar.append(CHANGE_IN_PROJECT_SCOPE)
    inputvar.append(COMMUNICATION_BREAKDOWN)
    inputvar.append(INADEQUATE)
    inputvar.append(PLANNING)
    inputvar.append(TEAM_MEMBER_PROCASTINATION)
    inputvar.append(CLIENT_CHANGES_IN_PROJECT)
    inputvar.append(EXTERNAL_CHANGES)


    print('input:', inputvar)
    ka = algo(inputvar,r)
    print('OUTPUT:',ka)
    st = new_file.objects.filter(id=r).update(solutions=ka)
    return redirect('/project_team_output/')


def technical_team_logout(request):
    if 'team' in request.session:
        request.session.pop('team',None)
        messages.info(request,'logout already successfully')
        return redirect('/')
    else:
        messages.info(request, 'session logged out')
        return redirect('/technical_team_logout')





def project_team_output(request):
    datas=new_file.objects.all()
    return render(request,'technical_team/project_team_output.html',{'datas':datas})


# def output_analyse(request):
#     # if 'manager' in request.session:
#     datas= new_file.objects.filter(approve=False)
#     return render(request,'technical_team/project_team_output.html', {'datas': datas})
