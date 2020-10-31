import json
from django.shortcuts import render, redirect
from django.views.generic import TemplateView, CreateView, ListView, DeleteView, UpdateView
from django.contrib.auth.views import LoginView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy
from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.http import JsonResponse
from .forms import *
from .models import *
from .tuplas import *
# Create your views here.


class Index(TemplateView):
    template_name = "page/index.html"


class IndexListView(ListView):
    model : Paquete
    template_name = "page/index.html"
    #context_object_name = 'object_list'
    queryset = Paquete.objects.filter(estadoPaquete = True)
    def get_queryset(self):
        queryset = super(IndexListView, self).get_queryset()
        return queryset.filter(estadoPaquete=True)
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Inicio'
        return context


class DetallePaqueteView(TemplateView):
    template_name = "page/detallePaquete.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['paquete'] = Paquete.objects.get(idPaquete= 1)
        context['listaDetalles'] = DetallePaquete.objects.all()
        context['page_title'] = 'Detalle del Paquete'
        context['moneda'] = MONEDA
        return context

class Conocenos(TemplateView):
    template_name = "page/conocenos.html"


class Contactanos(TemplateView):
    template_name = "page/contactanos.html"


class Login(LoginView):
    template_name = "page/login.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = "Iniciar Sesion"
        return context

class Login2(LoginView):
    template_name = "registration/login.html"

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = "Iniciar Sesion"
        return context

class RegistroPaqueteView(TemplateView):
    template_name = "page/registrarPaquete.html"



class SignUpView(CreateView):
    model = User
    form_class = SignUpForm

    def form_valid(self, form):
        '''
        En este parte, si el formulario es valido guardamos lo que se obtiene de él y usamos authenticate para que el usuario incie sesión luego de haberse registrado y lo redirigimos al index
        '''
        form.save()
        usuario = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password1')
        usuario = authenticate(username=usuario, password=password)
        login(self.request, usuario)
        return redirect('/')

class MisPaquetes(TemplateView):
    template_name = "page/misPaquetes.html"


class PanelControl(TemplateView):
    template_name = "page/panelControl.html"

    

class Busqueda(TemplateView):
    template_name = "management/busqueda.html"


class GestionHotel(TemplateView):
    template_name = "management/gestionHotel.html"


class GestionLugar(TemplateView):
    template_name = "management/gestionLugar.html"


class PaqueteListView(ListView):
    model = Paquete
    template_name = "management/gestionPaquete.html"
    queryset = Paquete.objects.filter(estadoPaquete = True)

class DetallePaqueteListView(ListView):
    model = DetallePaquete
    template_name = "management/gestionDetallePaquete.html"
    queryset = DetallePaquete.objects.filter(estadoDetallePaquete = True)


class Agencia(TemplateView):
    template_name = "page/agencia.html"

class PaqueteCreateView(CreateView,LoginRequiredMixin):
    model = Paquete
    template_name = "management/registrarPaquete.html"
    form_class = RegistrarPaqueteForm
    success_url = reverse_lazy('gestionPaquete')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Registro de Paquetes'
        context['listaDetalles'] = DetallePaquete.objects.filter(estadoDetallePaquete=True,paquete_detallePaquete=1)
        print(context['listaDetalles'])
        return context
    def get(self, request, *args,**kwargs):
        self.object= None
        form_class =self.get_form_class()
        form = self.get_form(form_class)
        return self.render_to_response(self.get_context_data(form=form))
    def form_valid(self, form):
        paquete = form.save(commit=False)
        paquete.save()
        return redirect('gestionPaquete')


class PaqueteUpdateView(UpdateView):    
    model = Paquete
    form_class = RegistrarPaqueteForm
    template_name = 'management/registrarPaquete.html'
    sucess_url = reverse_lazy('gestionPaquete')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        self.request.user.paqueteID = self.object.idPaquete
        context['page_title'] = 'Registro de Paquetes'
        context['listaDetalles'] = DetallePaquete.objects.filter(estadoDetallePaquete=True, paquete_detallePaquete=self.request.user.paqueteID)
        return context
    def get(self,request,*args,**kwargs):
        self.object = self.get_object()
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        return self.render_to_response(
                    self.get_context_data(form=form))
    def form_valid(self, form):
        obj = form.save(commit=False)
        obj.save()
        return redirect('gestionPaquete')


class UsuarioListView(ListView):
    model = Usuario
    template_name = "management/gestionUsuario.html"
    queryset = Usuario.objects.filter(is_active = True).order_by('-first_name')
    def get_queryset(self):
        queryset = super(UsuarioListView, self).get_queryset()
        return queryset.filter(is_active=True).order_by('-first_name')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Lista de Usuarios'
        context['entity'] = 'Usuario'
        return context

class UsuarioCreateView(CreateView):
    model = Usuario
    template_name = "management/registrarUsuario.html"
    form_class = Form_RegistroUsuario
    success_url = reverse_lazy('gestionUsuario')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Registro de Usuarios'
        context['entity'] = 'Usuario'
        return context

class UsuarioUpdateView(UpdateView):
    model = Usuario
    template_name = "management/registrarUsuario.html"
    form_class = Form_ModificarUsuario
    sucess_url = reverse_lazy('gestionUsuario')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Modificar Usuario'
        context['entity'] = 'Usuario'
        return context
    def form_valid(self, form):
        obj = form.save(commit=False)
        obj.save()
        return redirect('gestionUsuario')


@login_required
def eliminarUsuario(request, id):
    obj = Usuario.objects.get(id= id)
    obj.is_active = False
    obj.save()
    return redirect('gestionUsuario')

@login_required
def eliminarPaquete(request, idPaquete):
    obj = Paquete.objects.get(idPaquete= idPaquete)
    obj.estadoPaquete = False
    obj.save()
    return redirect('gestionPaquete')

@login_required
def upload_image_view(request):
    if request.method == 'POST':
        form = UploadImageForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            message = "Image uploaded succesfully!"
    else:
        form = UploadImageForm()
    return render(request, 'management/upload.html',{"form":form})


class PaqueteDeleteView(DeleteView):
    model = Paquete
    template_name = "management/eliminarPaquete.html"
    success_message = reverse_lazy('gestionPaquete')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Eliminar Paquete'
        context['entity'] = 'Paquete'
        context['list_url'] = redirect('gestionPaquete')
        context['action'] = 'edit'
        return context

class DetallePaqueteCreateView(CreateView):
    model = DetallePaquete
    form_class = DetallePaqueteForm
    template_name = 'management/registrarDetallePaquete.html'
    # permission_required = ('usuario.view_usuario', 'usuario.add_usuario',
    #                        'usuario.delete_usuario', 'usuario.change_usuario')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Registro de Tour del Paquete'
        return context
    def get_success_url(self, **kwargs):         
        if  kwargs != None:
            return reverse_lazy('modificarPaquete', kwargs = {'pk': self.request.user.paqueteID})
        else:
            return reverse_lazy('modificarPaquete', args = (self.request.user.paqueteID))
    # def post(self, request, *args, **kwargs):
    #     if request.is_ajax():
    #         form = self.form_class(request.POST)
    #         if form.is_valid():
    #             obj = DetallePaquete(
    #                 nroDiaPaquete=form.cleaned_data.get('nroDiaPaquete'),
    #                 paquete_detallePaquete=form.cleaned_data.get('paquete_detallePaquete'),
    #                 descripcionDetallePaquete=form.cleaned_data.get('descripcionDetallePaquete'),
    #                 imagenDetallePaquete=form.cleaned_data.get('imagenDetallePaquete')
    #             )
    #             obj.save()
    #             mensaje = f'{self.model.__name__} registrado correctamente!'
    #             error = 'No hay error!'
    #             response = JsonResponse({'mensaje':mensaje,'error':error})
    #             response.status_code = 201
    #             return response
    #         else:
    #             mensaje = f'{self.model.__name__} no se ha podido registrar!'
    #             error = form.errors
    #             response = JsonResponse({'mensaje': mensaje, 'error': error})
    #             response.status_code = 400
    #             return response
    #     else:
    #         return redirect('gestionUsuario')



