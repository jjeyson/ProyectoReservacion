import json
import itertools
from django.shortcuts import render, redirect
from django.views.generic import TemplateView, CreateView, ListView, DeleteView, UpdateView, DetailView
from django.contrib.auth.views import LoginView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy
from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.http import JsonResponse
from django.db.models import Count
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



class DetallePaqueteDetailView(DetailView):
    model = DetallePaquete
    template_name = "page/detallePaquete.html"
    model = Paquete

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if "paqueteID" in self.request.session:
            del self.request.session['num_visits']
            obj = Paquete.objects.get(idPaquete=self.object.pk)
            num_visits =  obj.visitasPaquete #self.request.session.get('num_visits', 0)
            self.request.session['num_visits'] = num_visits + 1
            Paquete.objects.filter(idPaquete=self.object.pk).update(visitasPaquete=self.request.session['num_visits'])
        #self.request.session['paqueteID'] = self.object.pk
        context['listaDetalles'] = DetallePaquete.objects.filter(paquete_detallePaquete = self.object.pk)
        context['page_title'] = 'Detalle del Paquete'
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



class ReservacionCreateView(CreateView):
    model = Reservacion
    template_name = "page/reservarPaquete.html"
    form_class = ReservacionForm
    def get_context_data(self, **kwargs):
        context = super(ReservacionCreateView,self).get_context_data(**kwargs)
        context["page_title"] = 'Registra tu '+Reservacion._meta.verbose_name.title()
        context["entity"] = Reservacion._meta.verbose_name.title() 
        return context
    


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


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_subtitle"] = "Recien Agregados"
        context["listaPaquetes"] = Paquete.objects.order_by('idPaquete')[:2]
        return context
    


# @login_required
# def buscar_libro(request):
#     if(request.GET.get("txt_buscar")):
#         #mensaje = "Libro Buscado: %r"%request.GET["txt_nombre"]
#         #libro = request.GET["txt_buscar"]
#         query = request.GET.get("txt_buscar")
#         if len(query)>50:
#             mensaje = "Titulo demasiado Largo, porfavor vuelva a intentarlo"
#         else:
#             #resultado = Libro.objects.filter(tituloLibro__resumenLibro__icontains = libro
#             #).distinct()
#             querys = (Q(tituloLibro__icontains=query) | Q(resumenLibro__icontains=query))
#             #querys |= Q(editorialLibro__icontains=query)

#             libros = Libro.objects.filter(querys)
#             return render(request,"GestionPrestamo/form_Busqueda_Libro.html", {'libros':libros,"query":query})


class GestionHotel(TemplateView):
    template_name = "management/gestionHotel.html"


class GestionLugar(TemplateView):
    template_name = "management/gestionLugar.html"


class PaqueteListView(ListView):
    model = Paquete
    template_name = "management/gestionPaquete.html"
    queryset = Paquete.objects.filter(estadoPaquete = True)
    paginate_by = 10
    def get_context_data(self, **kwargs):
        """
        Datos que se enviaran al template
        """
        context = super(PaqueteListView,self).get_context_data(**kwargs)

        # pq = Paquete.objects.get(idPaquete= self.request.session.get('paqueteID'))
        # print(pq)

        context['page_title'] = "Lista de "+ Paquete._meta.verbose_name_plural.title()
        context['entity'] = Paquete._meta.verbose_name.title()
        return context

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
    success_url = reverse_lazy('reservacion:gestionPaquete')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Registro de Paquetes'
        context['entity'] = 'Paquete'
        return context
    def get(self, request, *args,**kwargs):
        self.object= None
        form_class =self.get_form_class()
        form = self.get_form(form_class)
        return self.render_to_response(self.get_context_data(form=form))
    def form_valid(self, form):
        paquete = form.save(commit=False)
        paquete.save()
        return redirect('reservacion:gestionPaquete')


class PaqueteUpdateView(UpdateView):    
    model = Paquete
    form_class = RegistrarPaqueteForm
    template_name = 'management/registrarPaquete.html'
    sucess_url = reverse_lazy('reservacion:gestionPaquete')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        #paqueteID = self.request.session.get('paqueteID', 0)
        if "paqueteID" in self.request.session:
            self.request.session['paqueteID'] = self.object.pk
        context['page_title'] = 'Modificar Paquete'
        context['entity'] = 'Paquete'
        context['listaDetalles'] = DetallePaquete.objects.filter(estadoDetallePaquete=True, paquete_detallePaquete=self.request.session['paqueteID'])
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
        return redirect('reservacion:gestionPaquete')
    def post(self, request, **kwargs):
        # request.POST = request.POST.copy()
        # request.POST['some_key'] = 'some_value'
        return super(PaqueteUpdateView, self).post(request, **kwargs)


class UsuarioListView(ListView):
    model = Usuario
    template_name = "management/gestionUsuario.html"
    queryset = Usuario.objects.filter(is_active = True).order_by('-first_name')
    paginate_by = 10
    def get_queryset(self):
        queryset = super(UsuarioListView, self).get_queryset()
        return queryset.filter(is_active=True).order_by('-first_name')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Lista de '+Usuario._meta.verbose_name_plural.title()
        context['entity'] = Usuario._meta.verbose_name.title()
        return context

class UsuarioCreateView(CreateView):
    model = Usuario
    template_name = "management/registrarUsuario.html"
    form_class = Form_RegistroUsuario
    success_url = reverse_lazy('reservacion:gestionUsuario')
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
    return redirect(':reservacion:gestionPaquete')

@login_required
def eliminarDetallePaquete(request, idDetallePaquete):
    obj = DetallePaquete.objects.get(idDetallePaquete= idDetallePaquete)
    obj.estadoPaquete = False
    obj.save()
    return redirect('reservacion:gestionDetallePaquete')

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
        context['entity'] = 'Detalle Paquete'
        return context
    def get_success_url(self, **kwargs):         
        if  kwargs != None:
            return reverse_lazy('reservacion:modificarPaquete', kwargs = {'pk': self.request.session['paqueteID']})
        else:
            return reverse_lazy('reservacion:modificarPaquete', args = (self.request.session['paqueteID']))
    def get(self,request,*args,**kwargs):
        self.object = None
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        #contexto = super(DetallePaquete, self).get_context_data(**kwargs)
        # form.fields['paquete_detallePaquete'].queryset= Paquete.objects.filter(idPaquete=self.request.session['paqueteID']) 
        return self.render_to_response(
            self.get_context_data(form=form))
        # def form_valid(self, form):
        #     form.instance.paquete_detallePaquete = Paquete.objects.get(idPaquete=self.request.session['paqueteID']) 
        #     return super(DetallePaqueteCreateView, self).form_valid(form)
        def get_success_url(self):
            return reverse('reservacion:gestionLibro')

class DetallePaqueteUpdateView(UpdateView):
    model = DetallePaquete
    form_class = DetallePaqueteForm
    template_name = 'management/registrarDetallePaquete.html'
    def get_success_url(self, **kwargs):
        # obj = Paquete.objects.get(idPaquete = self.request.user.paqueteID)
        # print('GET_SUCESSS_URL'+obj)
        if  kwargs != None:
            return reverse_lazy('reservacion:modificarPaquete', kwargs = {'pk': self.request.session['paqueteID']})
        else:
            return reverse_lazy('reservacion:modificarPaquete', args = (self.request.session['paqueteID']))
    # def get(self,request,*args,**kwargs):
    #     self.object = None
    #     form_class = self.get_form_class()
    #     form = self.get_form(form_class)

    #     #contexto = super(DetallePaquete, self).get_context_data(**kwargs)
    #     form.fields['paquete_detallePaquete'].initial = Paquete.objects.get(idPaquete=self.request.session['paqueteID']) 
    #     return self.render_to_response(
    #                 self.get_context_data(form=form,cantidad=cantidad))
    #     def form_valid(self, form):
    #         libro = form.save(commit=False)
    #         libro.save()
    #         return redirect('gestionLibro')
    #     def get_success_url(self):
    #         return reverse('gestionLibro')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Modificar el Tour del Paquete'
        context['entity'] = 'Detalle Paquete'
        return context
    
    def post(self, request, **kwargs):
        request.POST = request.POST.copy()
        print(request.POST)
        
        return super(DetallePaqueteUpdateView, self).post(request, **kwargs)
    # def form_valid(self, form):
    #     obj = form.save(commit=False)
    #     obj.save()
    #     return redirect('modificarPaquete')
    
    # def dispatch(self, request, *args, **kwargs):
    #     self.obj = self.get_object()
            # if obj.company.user != request.user:
            #     raise PermissionDenied
    # def get_object(self, queryset=None):
    #     obj = getattr(self, 'object', None)
    #     if obj is None:
    #         obj = super().get_object(queryset)
    #     return obj
    
    
class CondicionCreateView(CreateView):
    model = Condicion
    form_class = CondicionForm
    template_name = 'management/registrarCondicion.html'
    # permission_required = ('usuario.view_usuario', 'usuario.add_usuario',
    #                        'usuario.delete_usuario', 'usuario.change_usuario')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Condiciones'
        context['entity'] = 'Condicion'
        return context
    # def get_success_url(self, **kwargs):         
    #     if  kwargs != None:
    #         if self.request.user.paqueteID:
    #             return reverse_lazy('registrarPaquete')
            
    #     else:
    #         if self.request.user.paqueteID:
    #             return reverse_lazy('registrarPaquete')


class DetallePaqueteDeleteView(DeleteView):
    model = DetallePaquete
    template_name = 'management/eliminarDetallePaquete.html'
    
    def get_context_data(self, **kwargs):
        context = super(DetallePaqueteDeleteView, self).get_context_data(**kwargs)
        context['page_title'] = 'Eliminar el Detalle del Paquete'
        context['entity'] = 'Detalle Paquete'
        return context
    
    def get_success_url(self, **kwargs):
        if  kwargs != None:
            return reverse_lazy('reservacion:modificarPaquete', kwargs = {'pk': self.request.session['paqueteID']})
        else:
            return reverse_lazy('reservacion:modificarPaquete', args = (self.request.session['paqueteID']))
    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.estadoDetallePaquete = True # Declare a boolean field is_deleted in your model. Default value is Flase.
        return HttpResponseRedirect(self.get_success_url())


class Recomendacion(TemplateView):
    template_name = "management/recomendacion.html"
    
    def get_context_data(self, **kwargs):
        context = super(Recomendacion, self).get_context_data(**kwargs)
        context['iterator'] = range(5)
        print(context['iterator'])
        context['page_title'] = "Recomendacion"
        context['listaNuevos'] = Paquete.objects.filter(estadoPaquete = True).order_by('-idPaquete')[:3]
        context['listaNuevos_c'] = Paquete.objects.filter(estadoPaquete = True).order_by('-idPaquete')
        context['listaVisitados'] = Paquete.objects.filter(estadoPaquete = True).order_by('-visitasPaquete')[:3]
        context['listaVisitados_c'] = Paquete.objects.filter(estadoPaquete = True).order_by('-visitasPaquete')
        # context['listaReservados'] =Paquete.objects.all().values('').annotate(total=Count('actor')).order_by('total')
        # context['listaReservados_c'] = Paquete.objects.filter(estadoPaquete = True).order_by('-visitasPaquete')
        return context
    
