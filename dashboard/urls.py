from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='tableaux'),
    path('login', views.loginView, name='login'),
    path('forgot_password/', views.forgot_password, name='forgot_password'),
    path('tableaux/', views.tableaux, name='tableaux'),
    path('diagramme/', views.diagramme, name='diagramme'),
    path('logout/', views.logoutView, name='logout'),
    path('download-csv/', views.message_download, name ='message_download'),
    path('download-pdf/', views.download_pdf, name ='download_pdf'),
    path('ajouter_admin/', views.formulaire, name='formulaire'),
    path('message_conflictuels/', views.message_conflictuels, name='message_conflictuels'),
]