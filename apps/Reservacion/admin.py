import json
from django.contrib import admin
#from django_google_maps import widgets as map_widgets
# from django_google_maps import fields as map_fields
from .models import *
# Register your models here.
admin.site.register(Usuario)
admin.site.register(Paquete)
admin.site.register(Album)
admin.site.register(AlbumImage)
# class RentalAdmin(admin.ModelAdmin): formfield_overrides = {
#     map_fields.AddressField: { 'widget':
#     map_widgets.GoogleMapsAddressWidget(attrs={
#       'data-autocomplete-options': json.dumps({ 'types': ['geocode',
#       'establishment'], 'componentRestrictions': {
#                   'country': 'us'
#               }
#           })
#       })
#     },
# }

class UsuarioAdmin(admin.ModelAdmin):
    list_display=("username","first_name","last_name", "email", "is_staff", "is_active","data_joined","DNIUsuario","telefonoUsuario")
    search_fields=("username","first_name","last_name","email")

class Paquete(admin.ModelAdmin):
    list_display= '__all__'
    search_fields=("username","first_name","last_name","email")

class AlbumImageInline(admin.TabularInline):
    model = AlbumImage
    extra = 3

class AlbumAdmin(admin.ModelAdmin):
    inlines = [ AlbumImageInline, ]