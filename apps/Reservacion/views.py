import json
import itertools
from datetime import datetime
from django.shortcuts import render, redirect
from django.views.generic import TemplateView, CreateView, ListView, DeleteView, UpdateView, DetailView
from django.contrib.auth.views import LoginView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy, reverse
from django.contrib.auth import login, authenticate
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.http import JsonResponse, HttpResponseRedirect
from django.db.models import Count
from .forms import *
from .models import *
from .tuplas import *


# Create your views here.

class IndexListView(ListView):
    model : Paquete
    template_name = "page/index.html"
    #context_object_name = 'object_list'
    #queryset = Paquete.objects.filter(estadoPaquete = True)
    def get_queryset(self):
        
        lista = []
        #lista de paquetes mas Baratos
        r1 = Paquete.objects.all().values('idPaquete','tituloPaquete', 'precioPaquete', 'disponibilidadPaquete').filter(estadoPaquete= True).order_by('precioPaquete')[:2]
        for obj in r1:
            if  obj['idPaquete'] not in lista:
                lista.append(obj['idPaquete'])
        
        # lista de paquetes con mejor promedio Score
        r2 = Rating.objects.all().values('paquete_rating','paquete_rating__tituloPaquete','paquete_rating__precioPaquete', 'paquete_rating__idPaquete').filter(estadoRating = True, paquete_rating__estadoPaquete = True).annotate(promedio = models.Sum('scoreRating')/Count('paquete_rating__tituloPaquete')).order_by('-promedio')[:2]
        for obj in r2:
            if  obj['paquete_rating__idPaquete'] not in lista:
                lista.append(obj['paquete_rating__idPaquete'])
        #lista de paquetes mas visitados
        r3 = Paquete.objects.filter(estadoPaquete = True).order_by('-visitasPaquete')[:2]
        for obj in r3:
            if  obj.idPaquete not in lista:
                lista.append(obj.idPaquete)
            
        #lista de paquetes mas reservados
        r4 = Reservacion.objects.all().values('paquete_reservacion', 'paquete_reservacion__idPaquete').annotate(total=Count('usuario_Reservacion')).order_by('-total')[:2]
        for obj in r4:
            if  obj['paquete_reservacion__idPaquete'] not in lista:
                lista.append(obj['paquete_reservacion__idPaquete'])
        #lista de recien añadidos
        r5 = Paquete.objects.filter(estadoPaquete = True).order_by('-fechaCreacionPaquete')[:1]
        for obj in r5:
            if  obj.idPaquete not in lista:
                lista.append(obj.idPaquete)
        print(lista)
        listaPaquetes = Paquete.objects.filter(idPaquete__in = lista)
        return listaPaquetes
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form_rating'] = Form_RegistroRating()
        context['page_title'] = 'Inicio'
        context['loop_times'] = range(1, 6)
        return context
    def get(self, request, *args, **kwargs):
        self.object_list = self.get_queryset()
        allow_empty = self.get_allow_empty()
        if not allow_empty:
            # When pagination is enabled and object_list is a queryset,
            # it's better to do a cheap query than to load the unpaginated
            # queryset in memory.
            if self.get_paginate_by(self.object_list) is not None and hasattr(self.object_list, 'exists'):
                is_empty = not self.object_list.exists()
            else:
                is_empty = not self.object_list
            if is_empty:
                raise Http404(_('Empty list and “%(class_name)s.allow_empty” is False.') % {
                    'class_name': self.__class__.__name__,
                })
        scoreRating = request.GET.get('scoreRating')
        idPaquete= request.GET.get('idPaquete')
        scores = Rating.objects.filter(estadoRating = True, paquete_rating__estadoPaquete = True, paquete_rating=idPaquete)
        veces = Rating.objects.filter(estadoRating = True, paquete_rating__estadoPaquete = True, paquete_rating=idPaquete).count()
        suma = 0
        for score in scores:
            if score is not None:
                suma = score.scoreRating
            else:
                pass
        print(veces)
        if veces != 0 :
            suma = suma/veces
        else:
            suma = suma
        idPaquete= request.GET.get('idPaquete')
        if scoreRating and idPaquete:
            obj = Paquete.objects.get(idPaquete = idPaquete)
            obj = Rating.objects.create(scoreRating=scoreRating, paquete_rating=obj)
            obj.save()
            
        return self.render_to_response(self.get_context_data(suma=suma))

# class RatingCreateView(JSONFormMixin, CreateView):
#     model = Rating
#     form_class = Form_RegistroRating


class PaquetesAllListView(ListView):
    model = Paquete
    template_name = "page/paquetesAll.html"
    queryset = Paquete.objects.filter(estadoPaquete= True, disponibilidadPaquete__gte = 1)
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_title"] = "Todos Los Paquetes Disponibles"
        return context
    



class DetallePaqueteDetailView(DetailView):
    model = DetallePaquete
    template_name = "page/detallePaquete.html"
    model = Paquete

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        self.request.session['paqueteID'] = self.object.pk
        print(str(self.request.session.get('paqueteID')) +'IDPAQUETE')
        obj = Paquete.objects.get(idPaquete=self.object.pk)
        num_visits =  obj.visitasPaquete #self.request.session.get('num_visits', 0)
        self.request.session['num_visits'] = num_visits + 1
        Paquete.objects.filter(idPaquete=self.object.pk).update(visitasPaquete=self.request.session['num_visits'])
        context['listaDetalles'] = DetallePaquete.objects.filter(paquete_detallePaquete = self.object.pk)
        context['page_title'] = 'Detalle del Paquete'
        context['condiciones'] = Condicion.objects.filter(paquete_condicion=self.request.session.get('paqueteID'))
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
    sucess_url = reverse_lazy('reservacion:index')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_title"] = 'Registra tu '+Reservacion._meta.verbose_name.title()
        context["entity"] = Reservacion._meta.verbose_name.title()
        context["habitaciones"] = HABITACIONES
        context["adultos"] = ADULTOS
        context["niños"] = NIÑOS
        print(str(self.request.session.get('paqueteID')) +' IDPAQUETE')
        context["paquete"] = Paquete.objects.get(idPaquete= self.request.session.get('paqueteID'))
        # form_class = self.get_form_class()
        # form = self.get_form(form_class)
        # print(form)
        # for field in form:
        #     print(field.label_tag)
        return context
    def get(self,request,*args,**kwargs):
        self.object = None
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        #contexto = super(Libro, self).get_context_data(**kwargs)   
        obj = Paquete.objects.get(idPaquete = request.session['paqueteID'])
        user = Usuario.objects.get(id = request.user.id)
        form.fields['paquete_reservacion'].initial = obj
        form.fields['precioPaquete'].initial = obj.precioPaquete
        form.fields['usuario_Reservacion'].initial = user
        print(request.user.id)
        return self.render_to_response(
                    self.get_context_data(form=form))
    def post(self, request, *args, **kwargs):
           self.object = None
           form_class = self.get_form_class()
           form = self.get_form(form_class)
           if (form.is_valid()):
               return self.form_valid(form)
           else:
               return self.form_invalid(form)

    def form_valid(self, form):
        self.object = form.save()
        return HttpResponseRedirect(self.get_success_url())

    def form_invalid(self, form):
           return self.render_to_response(
               self.get_context_data(form=form))
    def get_success_url(self):
        return reverse('reservacion:index')#, kwargs={'lawyer_slug': self.object.lawyer_slug}
    # def get_initial(self):
    #        recipe = get_object_or_404(Recipe, slug=self.kwargs.get('slug'))
    #        return {
    #            'recipe':recipe,
    #        }
    
    


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

@login_required
def misPaquetes_serializer(self):
    lista = []
    reservaciones = Reservacion.objects.filter(usuario_Reservacion=self.request.user).distinct()
    paquetes = Paquete.objects.all()
    for obj in reservaciones:
        for paq in paquetes:
            if obj.paquete_reservacion.idPaquete == paq.idPaquete:
                lista.append(paq)
    misPaquetes = list(dict.fromkeys(lista))
    
    return misPaquetes


class MisPaquetesListView(ListView, LoginRequiredMixin):
    model = Paquete
    template_name = "page/misPaquetes.html"
    paginate_by = 10
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        lista = []
        reservaciones = Reservacion.objects.filter(usuario_Reservacion=self.request.user).distinct()
        paquetes = Paquete.objects.all()
        for obj in reservaciones:
            for paq in paquetes:
                if obj.paquete_reservacion.idPaquete == paq.idPaquete:
                    lista.append(paq)
        misPaquetes = list(dict.fromkeys(lista))
        context["misPaquetes"] = misPaquetes

        # diccionario = dict(enumerate(set(paquetesUsuario)))
        # print(paquetesUsuario)
        # print(json.dumps(diccionario))
        
        #self.request.session['misPaquetes'] = json.dumps(diccionario)
        return context
    
    



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
    queryset = Paquete.objects.filter(estadoPaquete = True).order_by('-fechaCreacionPaquete')
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
        context['total'] = Paquete.objects.filter(estadoPaquete=True).count()
        return context

class DetallePaqueteListView(ListView):
    model = DetallePaquete
    template_name = "management/gestionDetallePaquete.html"
    queryset = DetallePaquete.objects.filter(estadoDetallePaquete = True)


class Agencia(TemplateView):
    template_name = "page/agencia.html"


class OfertasListView(ListView):
    template_name = "page/ofertas.html"
    queryset = Paquete.objects.filter(ofertaPaquete=True, estadoPaquete=True, disponibilidadPaquete__gte = 0)
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_title"] = 'Ofertas'
        return context
    



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
        # myDate = datetime.now()
        # formatedDate = myDate.strftime("%Y-%m-%d %H:%M:%S")
        # form.fields['fechaCreacionPaquete'].initial = formatedDate
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
        # if "paqueteID" in self.request.session:
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
    queryset = Usuario.objects.filter(is_active = True).order_by('-id')
    paginate_by = 10
    def get_queryset(self):
        queryset = super(UsuarioListView, self).get_queryset()
        return queryset.filter(is_active=True).order_by('-id')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Lista de '+Usuario._meta.verbose_name_plural.title()
        context['entity'] = Usuario._meta.verbose_name.title()
        context['total'] = Usuario.objects.filter(is_active=True).count()
        return context

class UsuarioCreateView(CreateView):
    model = Usuario
    template_name = "management/registrarUsuario.html"
    form_class = Form_RegistroUsuario
    success_url = reverse_lazy('reservacion:gestionUsuario')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Registro de Usuarios'
        context['lista'] = 'Lista de Usuarios'
        context['entity'] = 'Usuario'
        return context
    def get(self,request,*args,**kwargs):
        self.object = None
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        
        usernamelatest = Usuario.objects.values('username').filter().order_by('-id')[0]
        usernamelatest2 = Usuario.objects.values('last_name', 'first_name').filter().order_by('-id')[0]
        nameOfUser = usernamelatest2['first_name'] +' '+ usernamelatest2['last_name']
        latestUser = usernamelatest['username']
        form.fields['username'].initial = latestUser
        context = self.get_context_data()
        context['latestUser'] = latestUser
        form.fields['email'].initial = latestUser+'@gmail.com'
        form.fields['password1'].initial = latestUser+'1234'
        form.fields['password2'].initial = latestUser+'1234'
        
        #contexto = super(DetallePaquete, self).get_context_data(**kwargs)
        # form.fields['paquete_detallePaquete'].queryset= Paquete.objects.filter(idPaquete=self.request.session['paqueteID']) 
        return self.render_to_response(
            self.get_context_data(form=form, latestUser=latestUser, nameOfUser=nameOfUser))

class UsuarioUpdateView(UpdateView):
    model = Usuario
    template_name = "management/registrarUsuario.html"
    form_class = Form_ModificarUsuario
    success_url = reverse_lazy('reservacion:gestionUsuario')
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['page_title'] = 'Modificar Usuario'
        context['lista'] = 'Lista de Usuarios'
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
        form.fields['paquete_detallePaquete'].initial = Paquete.objects.get(idPaquete = self.request.session['paqueteID'])
        #contexto = super(DetallePaquete, self).get_context_data(**kwargs)
        # form.fields['paquete_detallePaquete'].queryset= Paquete.objects.filter(idPaquete=self.request.session['paqueteID']) 
        return self.render_to_response(
            self.get_context_data(form=form))
        # def form_valid(self, form):
        #     form.instance.paquete_detallePaquete = Paquete.objects.get(idPaquete=self.request.session['paqueteID']) 
        #     return super(DetallePaqueteCreateView, self).form_valid(form)
    # def get_success_url(self):
    #     return reverse('reservacion:gestionLibro')

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
    def get_success_url(self, **kwargs):        
        if  kwargs != None:
            return reverse_lazy('reservacion:modificarPaquete', kwargs = {'pk': self.request.session['paqueteID']})
        else:
            return reverse_lazy('reservacion:modificarPaquete', args = (self.request.session['paqueteID']))

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
        # print(context['iterator'])
        context['paquetes'] = Paquete.objects.all()
        context['page_title'] = "Recomendacion"
        context['listaNuevos'] = Paquete.objects.filter(estadoPaquete = True).order_by('-fechaCreacionPaquete')[:3]
        context['listaNuevos_c'] = Paquete.objects.filter(estadoPaquete = True).order_by('-fechaCreacionPaquete')
        context['listaVisitados'] = Paquete.objects.filter(estadoPaquete = True).order_by('-visitasPaquete')[:3]
        context['listaVisitados_c'] = Paquete.objects.filter(estadoPaquete = True).order_by('-visitasPaquete')
        #context['listaReservados'] =Reservacion.objects.all().values('usuario_reservacion').annotate(total=Count('usuario_reservacion')).order_by('total')
        context['listaReservados'] = Reservacion.objects.all().values('paquete_reservacion').annotate(total=Count('usuario_Reservacion')).order_by('-total')[:3]
        # lista de paquetes con mayor cantidad de veces de las mejores calificacion 
            # context['listaCalificados2'] = Rating.objects.all().values('paquete_Rating','paquete_Rating__tituloPaquete','paquete_Rating__precioPaquete', 'scoreRating').filter(estadoRating = True, paquete_Rating__estadoPaquete = True).annotate(total = Count('scoreRating')).order_by('-scoreRating','-total')[:3]
        # lista de paquetes con mejor promedio Score
        context['listaCalificados'] = Rating.objects.all().values('paquete_rating','paquete_rating__tituloPaquete','paquete_rating__precioPaquete').filter(estadoRating = True, paquete_rating__estadoPaquete = True).annotate(promedio = models.Sum('scoreRating')/Count('paquete_rating__tituloPaquete')).order_by('-promedio')[:3]
        # lista de paquetes mas Baratos
        context['listaComodos'] = Paquete.objects.all().values('idPaquete','tituloPaquete', 'precioPaquete', 'disponibilidadPaquete').filter(estadoPaquete= True).order_by('precioPaquete')[:3]
        context['listaOfertas'] = Paquete.objects.all().filter(estadoPaquete=True).order_by('precioPaquete')[:3]
        # print(context['listaCalificados2'])
        return context
    
