import csv, io
from django.shortcuts import render, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import permission_required
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, JsonResponse


from .models import Message 
from django.db.models import Count

# csv_file = request.FILES['file']

# if csv_file.name.endswith('.csv'):
#     messages.error(request, 'This is not a csv file')

# data_set = csv_file.read().decode('UTF-8')
# io_string = io.StringIO(data_set)
# next(io_string)
# for column in csv.reader(io_string, delimiter =',', quotechar="|"):
#     _, created = Message.update_or_create(

#     )
#     context = {}

#     return render(request, template, context)

@permission_required(login_url='/dashboard/login')
def message_download(request):
    items = Message.objects.all()

    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="message.csv"'

    writer = csv.writer(response, delimiter=',')
    writer.writerow(['message', 'etiquette'])


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
    return render(request, 'dashboard/tableaux.html', {"message_bon":message_bon, "message_fake":message_fake, "message_haine":message_haine,})