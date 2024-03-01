from django.views.generic import View
from django.http import HttpResponse, HttpRequest

class Hello(View):
    def get(self, request: HttpRequest, *args, **kwargs):
        name = request.GET.get('name', 'N/A')
        message = request.GET.get('message', 'N/A')
        return HttpResponse(f'Hello {name}! {message}!')
