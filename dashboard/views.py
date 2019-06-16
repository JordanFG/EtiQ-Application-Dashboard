import os

from django.shortcuts import render, redirect, render_to_response
from django.http import HttpResponse, JsonResponse, FileResponse
from django.template import loader
from django.utils.http import urlquote 
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages


# from django.xhtml2pdf.utils import generate_pdf
from xhtml2pdf import pisa             # import python module
from .models import Message
from django.db.models import Count, Q
from django.db.models.functions import TruncMonth

#Pour gerer les stats par intervalle de temps
from datetime import timedelta, date
from django.utils import timezone
import csv, io

from django.template import Context
from django.template.loader import get_template

from django.conf import settings


# from rest_framework.views import APIView
# from rest_framework.render_to_response import Response

# from  django.contrib.messages import constants as messages

# from .models import NameForm

# Create your views here.


def link_callback(uri, rel):
    """
    Convert HTML URIs to absolute system paths so xhtml2pdf can access those
    resources
    """
    # use short variable names
    sUrl = settings.STATIC_URL      # Typically /static/
    sRoot = settings.STATIC_ROOT    # Typically /home/userX/project_static/
    mUrl = settings.MEDIA_URL       # Typically /static/media/
    mRoot = settings.MEDIA_ROOT     # Typically /home/userX/project_static/media/

    # convert URIs to absolute system paths
    if uri.startswith(mUrl):
        path = os.path.join(mRoot, uri.replace(mUrl, ""))
    elif uri.startswith(sUrl):
        path = os.path.join(sRoot, uri.replace(sUrl, ""))
    else:
        return uri  # handle absolute uri (ie: http://some.tld/foo.png)

    # make sure that file exists
    if not os.path.isfile(path):
            raise Exception(
                'media URI must start with %s or %s' % (sUrl, mUrl)
            )
    return path

@login_required(login_url='/dashboard/login')
def index(request):

    return  render_to_response('dashboard/index.html', {})

def loginView(request):
    if request.user.is_authenticated:
        return redirect('dashboard.index')
    
    else:
        template = loader.get_template('dashboard/login.html')
        context = {
            
        }
        # if this is a POST request we need to process the form data
        # user = User.objects.create_user('lidvine', 'lidvine@gmail.com', 'kevmax')
        # user.save()
        if request.method == 'POST':
            username = request.POST['email']
            password = request.POST['password']
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('index')
            else:
                messages.add_message(request, messages.INFO, 'Wrong credentials!.')
                return render(request, 'dashboard/login.html', {})
            # if a GET (or any other method) we'll create a blank form
        else:
            return render(request, 'dashboard/login.html', {})

@login_required(login_url='/dashboard/login')
def logoutView(request):
        if request.user.is_authenticated:
            logout(request)
            return redirect('login')
        else:
            return redirect('login')




def forgot_password(request):
    redirect_url = urlquote("http://127.0.0.1:8000/forgot_password")
    return render_to_response('dashboard/forgot_password.html', { 'redirect_url' : redirect_url })

@login_required(login_url='/dashboard/login')
def tableaux(request):

    result = Message.objects.values('etiquette')\
                      .order_by('etiquette')\
                      .annotate(count=Count('etiquette'))
    for data in list(result):
        if data["etiquette"] in ["Bon", "bon"]:
            message_bon = data["count"]
        if data["etiquette"] in ["Haine", "haine"]:
            message_fake = data["count"]
        if data["etiquette"] in ["fake","Fake"]:
            message_haine = data["count"]

    return render_to_response('dashboard/tableaux.html', {"message_bon":message_bon, "message_fake":message_fake, "message_haine":message_haine,})

@login_required(login_url='/dashboard/login')
def diagramme(request):
    some_day_last_week = timezone.now().date() - timedelta(days=7)
    result_semaine = Message.objects.values('etiquette')\
                      .order_by('etiquette')\
                      .annotate(count=Count('etiquette'))\
                      .filter(dateAdded__gte=some_day_last_week)
    etiq_semaine = [val["count"] for val in list(result_semaine)]

    month = timezone.now().date() - timedelta(days=30)
    result_mois = Message.objects.values('etiquette')\
                      .order_by('etiquette')\
                      .annotate(count=Count('etiquette'))\
                      .filter(dateAdded__gte=month)
    etiq_mois = [val["count"] for val in list(result_mois)]

    annee = timezone.now().date() - timedelta(days=365)
    result_annee = Message.objects.values('etiquette')\
                      .order_by('etiquette')\
                      .annotate(count=Count('etiquette'))\
                      .filter(dateAdded__gte=annee)
    etiq_annee = [val["count"] for val in list(result_annee)]

    current_year_start = date(date.today().year, 1,1)
    current_year_end = date(date.today().year, 12,31)

    yearly_result = Message.objects\
                      .filter(dateAdded__gte=current_year_start).filter(dateAdded__lte=current_year_end)\
                      .annotate(month=TruncMonth("dateAdded")).values('etiquette','month')\
                      .order_by('etiquette')\
                      .annotate(count=Count('etiquette'))
    print("====>"+str(list(yearly_result)))
    month_values_bons = [0,0,0,0,0,0,0,0,0,0,0,0]
    month_values_haines = [0,0,0,0,0,0,0,0,0,0,0,0]
    month_values_fakes = [0,0,0,0,0,0,0,0,0,0,0,0]
    for data in yearly_result:
        if data["etiquette"] in ["Bon", "bon"]:
            month_values_bons[data["month"].month-1] =  data["count"] 
        if data["etiquette"] in ["Haine", "haine"]:
            month_values_haines[data["month"].month-1] = data["count"] 
        if data["etiquette"] in ["fake","Fake"]:
            month_values_fakes[data["month"].month-1] = data["count"]

    return render_to_response('dashboard/diagramme.html', {'etiq_semaine':etiq_semaine, "etiq_mois":etiq_mois, "etiq_annee":etiq_annee, "month_values_bons": month_values_bons, "month_values_haines": month_values_haines, "month_values_fakes": month_values_fakes})

@login_required(login_url='/dashboard/login')
def message_download(request):

    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="message.csv"'

    writer = csv.writer(response, delimiter=';')
    writer.writerows([['Etiquette'], ['Nombre']])

    result = Message.objects.values('etiquette')\
                      .order_by('etiquette')\
                      .annotate(count=Count('etiquette'))
    for data in list(result):
        writer.writerows([data["etiquette"], [data["count"]]])
    return response

def download_pdf(request):
    resp = HttpResponse(content_type='application/pdf')
    # dynamic_variable = request.user.some_special_something
    context = {}
    result = generate_pdf('tableaux.html', file_object=resp, context=context)
    return result



def download_pdf(request):
    template_path = 'dashboard/diagramme.html'
    context = {}
    # Create a Django response object, and specify content_type as pdf
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="report.pdf"'
    # find the template and render it.
    template = get_template(template_path)
    html = template.render(context)

    # create a pdf
    pisaStatus = pisa.CreatePDF(
       html, dest=response, link_callback=link_callback)
    # if error then show some funy view
    if pisaStatus.err:
       return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response

@login_required(login_url='/dashboard/login')
def formulaire(request):
    return render_to_response('dashboard/formulaire.html', {})

