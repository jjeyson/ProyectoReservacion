from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.conf import settings
from django.contrib.auth.models import User
from django.contrib.sessions.models import Session
from .models import *
from apps.Reservacion.tuplas import *


class ReservacionForm(forms.ModelForm):
    """Form definition for Reservacion."""

    class Meta:
        """Meta definition for Reservacionform."""

        model = Reservacion
        fields = ('estadoReservacion','precioReservacion')
        #readonly_fields = ['fechaRegistroReservacion','fechaEntradaReservacion','fechaSalidaReservacion']


class RegistrarPaqueteForm(forms.ModelForm):
    condicion_paquete = forms.ModelMultipleChoiceField(
        queryset=Condicion.objects.filter(estadoCondicion= True),
        
       )
    estadoPaquete = forms.BooleanField(widget=forms.HiddenInput(), initial=True)
    class Meta:
        model = Paquete
        fields = '__all__'
        labels ={
            'idPaquete':'Identificador de Paquete',
            'tituloPaquete':'Titulo',
            'nDiasPaquete':'Cantidad de Días',
            'nNochesPaquete':'Cantidad de Noches',
            'nHorasPaquete':'Horas del Paquete',
            'tipoMonedaPaquete':'Tipo de Moneda',
            'precioPaquete':'Precio',
            'unidadPorPrecioPaquete':'Unidad por precio',
            'edadMinimaPaquete':'Edad Mínima',
            'visitasPaquete': 'Visitas',
            'mesPaquete':'Mes Disponible',
            'disponibilidadPaquete':'Disponibilidad',
            'imagenPaquete':'Imagen del Paquete',
            'condicion_paquete':'Condiciones',
            'estadoPaquete':'Activo',
        }
        widgets = {
            'tituloPaquete': forms.TextInput(attrs={'class': 'form-control',
                                                'placeholder':'Ingrese el titulo'}),
            'nDiasPaquete': forms.Select(attrs={'class': 'form-control','id':'nDiasPaquete'}),
            'nNochesPaquete': forms.Select(attrs={'class': 'form-control','id':'nNochesPaquete'}),
            'tipoMonedaPaquete': forms.Select(attrs={'class': 'form-control','id':'tipoMonedaPaquete'}),
            'unidadPorPrecioPaquete': forms.Select(attrs={'class': 'form-control','id':'unidadPorPrecioPaquete'}),
            'edadMinimaPaquete': forms.NumberInput(attrs={'class': 'form-control','id':'edadMinimaPaquete'}),
            'mesPaquete': forms.Select(attrs={'class': 'form-control','id':'mesPaquete'}),
            'disponibilidadPaquete': forms.NumberInput(attrs={'class': 'form-control','id':'disponibilidadPaquete'}),
            'precioPaquete': forms.NumberInput(attrs={'class': 'form-control','id':'precioPaquete', 'default':1000}),
            'estadoPaquete': forms.RadioSelect(attrs={'class': 'form-control','id':'estadoPaquete'}),
            'visitasPaquete': forms.NumberInput(attrs={'class': 'form-control','id':'visitasPaquete','disabled': True, 'default':0}),
            'nHorasPaquete': forms.NumberInput(attrs={'class': 'form-control','id':'nHorasPaquete'}),
        }
    def __init__(self, *args, **kwargs):
        if kwargs.get('instance'):
            initial = kwargs.setdefault('initial', {})
            initial['condicion_paquete'] = [t.pk for t in
                kwargs['instance'].condicion_paquete.all()]

        forms.ModelForm.__init__(self, *args, **kwargs)
    
    def save(self, commit=True):
        instance = forms.ModelForm.save(self, False)
        old_save_m2m = self.save_m2m
        def save_m2m():
            old_save_m2m()
            # This is where we actually link the pizza with toppings
            instance.condicion_paquete.clear()
            print("Esta son las condiciones Seleccionadas")
            for obj in self.cleaned_data['condicion_paquete']:
                instance.condicion_paquete.add(obj)
                print(obj)
        self.save_m2m = save_m2m
        instance.save()
        self.save_m2m()
        return instance

    


class FormLogin(forms.Form):
    """FormLogin definition."""
    username = forms.CharField(max_length=50, required=True)
    password = forms.CharField(max_length=50, required=True)
    # TODO: Define form fields here


class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=140, required=True)
    last_name = forms.CharField(max_length=140, required=False)
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = (
            'username',
            'first_name',
            'last_name',
            'email',
            'password1',
            'password2',
            'is_staff',
        )

class Form_RegistroUsuario(forms.ModelForm):
    is_active = forms.BooleanField(widget=forms.HiddenInput(), initial=True)
    is_staff = forms.BooleanField(initial=False,label='Administrador',widget=forms.CheckboxInput(
                attrs = {
                    'class':'form-control',
                }))
    first_name = forms.CharField(label='Nombre',widget=forms.TextInput(attrs={
        'class':'form-control',
        'placeholder':'Ingrese su nombre',}))
    last_name = forms.CharField(label='Apellidos', widget=forms.TextInput(attrs={
        'class':'form-control',
        'placeholder':'Ingrese su apellido',}))
    password1 = forms.CharField(label='Clave',widget=forms.PasswordInput(
        attrs = {
            'class':'form-control',
            'placeholder':'Ingrese su contraseña...',
            'id': 'password1',
            'required': 'required',
        }))
    password2 = forms.CharField(label='Clave de confirmación',widget=forms.PasswordInput(
        attrs = {
            'class':'form-control',
            'placeholder':'Ingrese nuevamente su contraseña...',
            'id': 'password2',
            'required': 'required',
        }))
    class Meta:
        model = Usuario
        fields = ( 'username','first_name','last_name', 'DNIUsuario','email', 'is_staff', 'imagenUsuario')
        widgets = {
            'first_name': forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese su nombre',
                }),
            'last_name': forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese sus apellidos',
                }),
            'DNIUsuario': forms.TextInput(
                attrs={
                    'class':'form-control',
                    'placeholder':'Ingrese el documento de identidad'
                }) ,
            'username': forms.TextInput(
                attrs={
                    'class':'form-control',
                    'placeholder':'Ingrese el nombre de usuario'
                }),
            'email': forms.EmailInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese su email',
                })
        #ordering = ['-fecha']
            }
    def __init__(self, *args, **kwargs):
        super(Form_RegistroUsuario, self).__init__(*args, **kwargs)
        for fieldname in ['first_name','username', 'password1', 'password2']:
            self.fields[fieldname].help_text = None
    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        print(self.cleaned_data)
        if password1 != password2:
            raise forms.ValidationError('Contraseñas no coinciden')
        return password2
    def save(self,commit=True):
        user = super().save(commit = False)
        user.set_password(self.cleaned_data['password1'])
        print(self.cleaned_data)
        if commit:
            user.save()
        return user

class Form_ModificarUsuario(forms.ModelForm):
    is_active = forms.BooleanField(widget=forms.HiddenInput(), initial=True)
    is_staff = forms.BooleanField(initial=False,label='Administrador',widget=forms.CheckboxInput(
                attrs = {
                    'class':'form-control',
                }))
    first_name = forms.CharField(label='Nombre',widget=forms.TextInput(attrs={
        'class':'form-control',
        'placeholder':'Ingrese su nombre',}))
    last_name = forms.CharField(label='Apellidos', widget=forms.TextInput(attrs={
        'class':'form-control',
        'placeholder':'Ingrese su apellido',}))
    class Meta:
        model = Usuario
        fields = ( 'username','first_name','last_name', 'DNIUsuario','email', 'is_staff', 'imagenUsuario')
        widgets = {
            'first_name': forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese su nombre',
                }),
            'last_name': forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese sus apellidos',
                }),
            'DNIUsuario': forms.TextInput(
                attrs={
                    'class':'form-control',
                    'placeholder':'Ingrese el documento de identidad'
                }) ,
            'username': forms.TextInput(
                attrs={
                    'class':'form-control',
                    'placeholder':'Ingrese el nombre de usuario'
                }),
            'email': forms.EmailInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese su email',
                })
        #ordering = ['-fecha']
            }
        def save(self,commit=True):
            user = super().save(commit = false)
            if commit:
                user.save()
            return user

class DetallePaqueteForm(forms.ModelForm):
    """Formulario de detalle de Paquete."""
    estadoDetallePaquete = forms.BooleanField(widget=forms.HiddenInput(), initial=True)
    paquete_detallePaquete = forms.ModelChoiceField(label='IDPaquete',queryset=Paquete.objects.all())
    class Meta:
        """Meta definition for DetallePaqueteform."""

        model = DetallePaquete
        fields = ('nroDiaDetallePaquete', 'tituloDetallePaquete','paquete_detallePaquete','descripcionDetallePaquete','imagenDetallePaquete')
        widgets = {
            'tituloDetallePaquete': forms.TextInput(
                attrs = {
                    'class':'form-control'
                }),
            'nroDiaDetallePaquete': forms.NumberInput(
                attrs = {
                    'class':'form-control'
                }),
            'descripcionDetallePaquete': forms.Textarea(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese la descripción',
                }),
        #ordering = ['-fecha']
            }
    # def __init__(self,*args,**kwargs):
    #     pass
        # session_paqueteID = kwargs.pop('session_paqueteID')
        #self.fields['paquete_detallePaquete'].queryset = Rate.objects.filter(company=company)
        # self.fields['paquete_detallePaquete'] = forms.ModelChoiceField(queryset=Paquete.objects.get(idPaquete=session_paqueteID))
        #forms.ModelMultipleChoiceField(label='IDPaquete',widget=forms.HiddenInput(),initial=self.request.session['paqueteID'])
    
class CondicionForm(forms.ModelForm):
    """Formulario de detalle de Paquete."""
    estadoCondicion = forms.BooleanField(widget=forms.HiddenInput(), initial=True)
    
    class Meta:
        """Meta definition for DetallePaqueteform."""

        model = Condicion
        fields = ('tituloCondicion','descripcionCondicion','estadoCondicion')
        widgets = {
            'tituloCondicion': forms.TextInput(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese el titulo',
                }),
            'descripcionCondicion': forms.Textarea(
                attrs = {
                    'class':'form-control',
                    'placeholder':'Ingrese la descripción',
                })
        #ordering = ['-fecha']
            }

class UploadImageForm(forms.ModelForm):

    class Meta:
        model = AlbumImage
        fields = ['album', 'image']