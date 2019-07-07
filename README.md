# EtiQ-Application-Dashboard

Pour avoir notre dashboard installe dans sa machine, il est necessaire d'avoir 
- Python(>=3.4)
- MySQL(>5.6)

Puis suivre les etapes suivantes:

1- Se placer dans le dossier de l'application

2- Creer un envirennement virtuel
```python3 -m venv venv```

3- Activer l'environnement virtuel
```source venv/bin/activate```

4- Installer toutes les dependances necessaires au fonctionnement de l'application
```pip install -r requirements.txt```

5- Creer une base de donnees:

6- Parametrer la connexion a la base de donnees:
    Pour cela ouvrir le ficher settings(INF430>>INF430>>settings.py).
    rechercher la variable **DATABASES** et modifier les configurations suivantes:
```        
    'NAME': 'nom_de_votre_bd',
    'USER': 'nom_dutilisateur',
    'PASSWORD': 'votre_mot_de_passe',
    'HOST': '127.0.0.1',
    'PORT': 'numero_de_port',
```
7-Importer le fichier **database.sql** dans la base de donnees creee initialement

8- Lancer l'application
```python manage.py runserver```


