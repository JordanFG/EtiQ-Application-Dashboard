from django.db import models
# Create your models here.


class User(models.Model):
    class Meta:
        db_table = 'users'
        managed = False
    pseudo = models.CharField(max_length=100)
    email = models.EmailField()
    password = models.CharField(max_length=20)
    isAdmin = models.BooleanField(default=False)

class Message(models.Model):
    class Meta:
        db_table = 'message'
        managed = False
    idUser = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.TextField()
    ETIQUETTE_CHOICES = [
        ('BON', 'BON'),
        ('FAKE_NEWS', 'FNM'),
        ('HAINE', (
            ('TRIBALISTE','TRIBALISTE'),
            ('ANTISEMIQUE', 'ANTISEMIQUE'),
            ('ISLAMOPHOBE', 'ISLAMOPHOBE')
            )
        )
    ]
    etiquette = models.CharField(max_length=10, choices=ETIQUETTE_CHOICES )
    # authors = models.ManyToManyField(Author)
    dateAdded = models.DateField()

    # def __str__(self):
    #     return self.textMessage
