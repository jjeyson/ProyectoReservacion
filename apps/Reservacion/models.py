from django.db import models
from django.contrib.auth.models import AbstractUser
from django.conf import settings
from django.core.validators import MaxValueValidator, MinValueValidator
from apps.Reservacion.tuplas import *
#from django_google_maps import fields as map_fields 
# Create your models here.

# class Rental(models.Model):
#     address = map_fields.AddressField(max_length=200)
#     geolocation = map_fields.GeoLocationField(max_length=100)



class Usuario(AbstractUser):
    imagenUsuario = models.ImageField(verbose_name='Imagen de Perfil', upload_to='img/users/', blank=True, null=True)
    DNIUsuario = models.CharField(max_length=20,verbose_name='Doc. Identidad', help_text='')
    telefonoUsuario = models.CharField(max_length=20, verbose_name='Telefono', help_text='No incluya Parentesis, ni guiones ni espacios')
    
    class Meta: 
        """Meta definition for Paquete."""

        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
    
    def __str__(self):
        return self.username

    def get_image(self):
        if self.imagenUsuario:
            return '{}{}'.format(settings.MEDIA_URL, self.imagenUsuario)
        return '{}{}'.format(settings.STATIC_URL,'img/users/empty.png')

class TipoUsuario(models.Model):
    idTipoUsuario = models.AutoField(primary_key=True, help_text="ID único para esta Tipo de Usuario")
    nombreTipoUsuario = models.CharField(max_length=100, verbose_name='Nombre')
    fechaCreacionTipoUsuario = models.DateTimeField(auto_now_add=True, blank=True, verbose_name='Fecha de Creacion')
    estadoTipoUsuario = models.BooleanField(verbose_name='Activo', default=True)
    def __str__(self):
        """Cadena para representar el objeto Modelo (en el sitio de administración, etc.)"""
        return self.nombreTipoUsuario

class Hotel(models.Model):
    idHotel = models.AutoField(primary_key=True, help_text="ID único para Hotel")
    nombreHotel = models.DateTimeField(verbose_name='Nombre', help_text="nombre de Hotel donde se hospedará")
    ciudadHotel = models.DateTimeField(verbose_name='Ciudad', help_text="nombre de la ciudad del Hotel")
    telefonoHotel = models.DateTimeField(verbose_name='Telefono', help_text="ID único para Hotel")
    estadoVuelo = models.BooleanField(verbose_name='estado', default=True)

    class Meta:
        ordering = ["idHotel"]

    def __str__(self):
        return self.idHotel


class Vuelo(models.Model):
    idVuelo = models.AutoField(primary_key=True, help_text="ID único para Vuelo")
    origenVuelo = models.TextField(max_length=500, verbose_name='Origen')
    destinoVuelo = models.TextField(max_length=500, verbose_name='Destino')
    fechaVuelo = models.DateTimeField(verbose_name='Fecha de Vuelo', auto_now_add=True)
    estadoVuelo = models.BooleanField(verbose_name='Activo', default=True)

    class Meta:
        ordering = ["idVuelo"]

    def __str__(self):
        return self.idVuelo

class VueloTurista(models.Model):
    idVueloTurista = models.AutoField(primary_key=True, help_text="ID único para Vuelo Turista")
    descripcion_vueloTurista = models.TextField(max_length=500, verbose_name='Descripcion de Vuelo')
    vuelo_vueloTurista = models.ForeignKey(Vuelo, on_delete=models.SET_NULL, null=True)
    estadoVueloTurista = models.BooleanField(verbose_name='Activo', default=True)

    class Meta:
        ordering = ["idVueloTurista"]

    def __str__(self):
        return self.idVueloTurista

# class ViajeContratado(models.Model):
#     idViajeContratado = models.AutoField(primary_key=True, help_text="ID único para Viaje contratado")
#     reservacion_viajeContratado = models.ForeignKey(Reservacion, on_delete=models.SET_NULL, null=True)
#     usuario_viajeContratado = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True)
#     vueloTurista_vueloContratado = models.ForeignKey(VueloTurista, on_delete=models.SET_NULL, null= True)
#     estadoViajeContratado = models.BooleanField(verbose_name='Activo', default=True)

#     class Meta:
#         ordering = ["idViajeContratado"]

#     def __str__(self):
#         return self.reservacion_viajeContratado


class Paquete(models.Model):
    """Paquete Turistico."""
    idPaquete  = models.AutoField(primary_key=True, help_text="ID único para este Paquete")
    tituloPaquete = models.CharField(max_length=250,verbose_name='titulo del paquete' , blank=True, null=True, unique=True)
    nDiasPaquete = models.CharField(verbose_name='Cantidad de días', max_length=2, choices=CANTIDAD, blank=True, default='0', help_text='')
    nNochesPaquete = models.CharField(verbose_name='Cantidad de noches', max_length=2, choices=CANTIDAD, blank=True, default='0', help_text='')
    nHorasPaquete = models.CharField(verbose_name='Cantidad de Horas', max_length=2, choices=HORAS, blank=True, default='0', help_text='')
    tipoMonedaPaquete = models.CharField(verbose_name='Tipo de moneda', max_length=1, choices=MONEDA, blank=True, default='s', help_text='Un solo Dia')
    precioPaquete = models.DecimalField(verbose_name='Precio',help_text='Precio en soles o dólares',max_digits=8, decimal_places=2, blank=True, null=True, default=500.00)
    unidadPorPrecioPaquete = models.CharField(verbose_name='Unidad por precio', max_length=1, choices=UNIDADPORPAGO, blank=True, null=True, default='p', help_text='')
    edadMinimaPaquete = models.PositiveIntegerField(default=5, validators=[MinValueValidator(1), MaxValueValidator(18)], blank=True, null=True,help_text='')
    visitasPaquete = models.PositiveIntegerField(verbose_name='Visitas',help_text='', blank=True, null=True, default=0)
    mesPaquete = models.CharField(verbose_name='Mes de Disponiblidad', max_length=15, choices=MESES, null=True,blank=True, default='Todos los meses', help_text='')
    disponibilidadPaquete = models.PositiveIntegerField(verbose_name='Numero de Cupos', null=True,blank=True, help_text='', default=150, validators=[MinValueValidator(0), MaxValueValidator(150)])
    imagenPrincipal = models.ImageField(verbose_name='Imagen de Fondo', upload_to='img/paquetes/', blank=True, null=True)
    imagenAvatar = models.ImageField(verbose_name='Imagen Pequeña', upload_to='img/paquetes/', blank=True, null=True)
    fechaCreacionPaquete = models.DateTimeField(verbose_name='Fecha de Registro', auto_now_add=True , blank=True, null=True)
    ofertaPaquete = models.BooleanField(verbose_name='Oferta', default=True,null=True, blank=True)
    estadoPaquete = models.BooleanField(verbose_name='Activo', default=True, null=True, blank=True)
    class Meta: 
        """Meta definition for Paquete."""

        verbose_name = 'Paquete'
        verbose_name_plural = 'Paquetes'

    def __str__(self):
        return str(self.tituloPaquete)
    def get_imageAvatar(self):
        if self.imagenAvatar:
            return '{}{}'.format(settings.MEDIA_URL, self.imagenAvatar)
        return '{}{}'.format(settings.STATIC_URL,'img/paquetes/empty.png')
    def get_imagePaquete(self):
        if self.imagenPrincipal:
            return '{}{}'.format(settings.MEDIA_URL, self.imagenPrincipal)
        return '{}{}'.format(settings.STATIC_URL,'img/paquetes/empty.png')
    def get_precioAntiguo(self):
        """
        Traer el Precio anterior
        """
        return self.precioPaquete+100

class Condicion(models.Model):
    """Model definition for CondicionPaquete."""

    idCondicion = models.AutoField(verbose_name="ID CONDICION PAQUETE", primary_key=True, help_text='ID unico')
    
    tituloCondicion = models.CharField(verbose_name="Tipo de Condicion", max_length=250, help_text='', null=True, blank=True)
    tipoCondicion = models.CharField(verbose_name="Tipo de Condicion", max_length=1, choices=CONDICIONPAQUETE, help_text='', null=True, blank=True)
    descripcionCondicion = models.TextField(verbose_name="Descripcion de la condicion", max_length=1000, null=True, blank=True, help_text='')
    paquete_condicion = models.ManyToManyField(Paquete, verbose_name="Tags", help_text="")
    estadoCondicion = models.BooleanField(verbose_name='Es Activo',default=True)

    class Meta:
        """Meta definition for CondicionPaquete."""

        verbose_name = 'CondicionPaquete'
        verbose_name_plural = 'CondicionPaquetes'

    def __str__(self):
        return self.descripcionCondicion

class DetallePaquete(models.Model):
    idDetallePaquete  = models.AutoField(primary_key=True, help_text="ID único para este Paquete")
    tituloDetallePaquete = models.CharField(max_length=250,verbose_name='titulo del paquete' , blank=True, null=True)
    nroDiaDetallePaquete = models.PositiveSmallIntegerField(verbose_name='Numero de Dia', null=True,help_text='', default=1)
    paquete_detallePaquete = models.ForeignKey(Paquete,on_delete=models.SET_NULL , null=True, blank=True)
    descripcionDetallePaquete = models.TextField(verbose_name='Descripcion', max_length=2000, null=True, blank=True)
    imagenDetallePaquete = models.ImageField(verbose_name='Imagen', upload_to='img/detallePaquete/', blank=True, null=True)
    estadoDetallePaquete = models.BooleanField(verbose_name='Es Activo',default=True)
    class Meta: 
        """Meta definition for Paquete."""

        verbose_name = 'Detalle del Paquete'
        verbose_name_plural = 'Detalles del Paquete'

    def get_imagenDetallePaquete(self):
        if self.imagenDetallePaquete:
            return '{}{}'.format(settings.MEDIA_URL, self.imagenDetallePaquete)
        return '{}{}'.format(settings.STATIC_URL,'img/paquetes/empty.png')
    def __str__(self,):
        return str(self.nroDetalleDiaPaquete)


class Reservacion(models.Model):
    idReservacion = models.AutoField(primary_key=True, help_text="ID único para esta Reservacion")
    fechaViajeReservacion = models.DateTimeField(verbose_name='Fecha de Registro', auto_now_add=True , blank=True, null=True)
    #fechaEntradaReservacion = models.DateTimeField(verbose_name='Fecha de Entrada ', auto_now_add=True, blank=True)
    #fechaSalidaReservacion = models.DateTimeField(verbose_name='Fecha de Salida', auto_now_add=True, blank=True)
    adultosReservacion = models.CharField(verbose_name='Cantidad de adultos', max_length=2, choices=ADULTOS, blank=True, default='0', help_text='')
    niñosReservacion = models.CharField(verbose_name='Cantidad de niños', max_length=2, choices=NIÑOS, blank=True, default='0', help_text='')
    cuposReservacion = models.PositiveSmallIntegerField(verbose_name='Cupos (Personas)', null=True,blank=True, help_text='', default=1, validators=[MinValueValidator(1), MaxValueValidator(50)])
    paquete_reservacion = models.ForeignKey(Paquete,on_delete=models.SET_NULL , null=True, blank=True, verbose_name='Destino')
    usuario_Reservacion = models.ForeignKey(Usuario, verbose_name='Usuario', on_delete=models.SET_NULL, blank=True, null=True)
    precioReservacion = models.IntegerField(verbose_name='Pension', help_text="Cantidad de Dinero en Soles" )
    #hotel_reservacion = models.ForeignKey(Hotel,on_delete=models.SET_NULL, null=True)

    estadoReservacion = models.BooleanField(verbose_name='Activo', default=True)
    class Meta: 
        """Meta definition for Paquete."""

        verbose_name = 'Reservacion'
        verbose_name_plural = 'Reservaciones'
    # class Meta:
    #     ordering = ["idReservacion"]

    def __str__(self):
        return self.idReservacion

class Rating(models.Model):
    # idRating = models.Autofield(primary_key=True, help_text="ID único para este rating")
    usuario_Rating = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, blank=True)
    paquete_rating = models.ForeignKey(Paquete, on_delete=models.SET_NULL, null=True, blank=True)
    scoreRating = models.PositiveSmallIntegerField(verbose_name='Valoracion', null=True,blank=True, help_text='', default=1, validators=[MinValueValidator(1), MaxValueValidator(5)])
    # fechaCreacionRating = models.DateTimeField(auto_now_add=True, verbose_name='Fecha de Creación')
    estadoRating = models.BooleanField(verbose_name='Activo', default=True)

    def __str__(self):
        return str(self.pk)


class Album(models.Model):
    owner = models.ForeignKey('Reservacion.Usuario',on_delete=models.CASCADE, null=False)
    title = models.CharField(max_length=200)
    timestamp = models.DateTimeField(auto_now_add=True, auto_now=False)
    updated = models.DateTimeField(auto_now_add=False, auto_now=True)

    def __unicode__(self,):
        return self.title

class AlbumImage(models.Model):
    album = models.ForeignKey(Album, related_name='images',on_delete=models.SET_NULL, null=True)
    image = models.ImageField(upload_to='albums/images/')

    def __unicode__(self,):
        return str(self.image)








