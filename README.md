# EtiQ-Application-Dashboard

Pour avoir notre dashboard installe dans sa machine, il est necessaire d'avoir 
- Python(>=3.4) if not use ```sudo apt-get install python3-pip```
- MySQL(>5.6)

Puis suivre les etapes suivantes:

1- Se placer dans le dossier de l'application

2- Install pip if not install
```sudo pip3 install virtualenv```

3- Creer un envirennement virtuel
```virtualenv -p python3 myenv```

4- Activer l'environnement virtuel
```source venv/bin/activate```

5- Installer toutes les dependances necessaires au fonctionnement de l'application
```pip install -r requirements.txt```

6- Creer une base de donnees

7- Parametrer la connexion a la base de donnees:
    Pour cela ouvrir le ficher settings(INF430>>INF430>>settings.py).
    rechercher la variable **DATABASES** et modifier les configurations suivantes:
```        
    'NAME': 'nom_de_votre_bd',
    'USER': 'nom_dutilisateur',
    'PASSWORD': 'votre_mot_de_passe',
    'HOST': '127.0.0.1',
    'PORT': 'numero_de_port',
```
8-Importer le fichier **database.sql** dans la base de donnees creee initialement

9- Lancer l'application
```python manage.py runserver```
