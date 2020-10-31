from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.conf import settings
from django.contrib.auth.models import User
from .models import *
from apps.Reservacion.tuplas import *


class RegistrarPaqueteForm(forms.ModelForm):
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
    # paquete_detallePaquete = forms.ModelMultipleChoiceField(
    #     queryset=DetallePaquete.objects.all(),
        
    #    )
    class Meta:
        """Meta definition for DetallePaqueteform."""

        model = DetallePaquete
        fields = ('nroDiaPaquete', 'tituloDetallePaquete','paquete_detallePaquete','descripcionDetallePaquete','imagenDetallePaquete')
        widgets = {
            'tituloDetallePaquete': forms.TextInput(
                attrs = {
                    'class':'form-control'
                }),
            'nroDiaPaquete': forms.NumberInput(
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



class UploadImageForm(forms.ModelForm):

    class Meta:
        model = AlbumImage
        fields = ['album', 'image']