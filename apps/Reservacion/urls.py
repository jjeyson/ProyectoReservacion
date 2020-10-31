from django.urls import path, include
from django.conf import settings
from apps.Reservacion import models, views

urlpatterns = [
    path('login/', views.Login.as_view(),name='login3'),
    path('',include('django.contrib.auth.urls'),name='login'),
    path('login2/',views.Login2.as_view(),name='login2'),
    path('index', views.IndexListView.as_view(),name='index'),
    path('detallePaquete',views.DetallePaqueteView.as_view(), name='detallePaquete'),
    path('conocenos',views.Conocenos.as_view(), name='conocenos'),
    path('contactanos',views.Contactanos.as_view(), name='contactanos'),
    path('misPaquetes',views.MisPaquetes.as_view(), name='misPaquetes'),
    path('panelControl',views.PanelControl.as_view(), name='panelControl'),
    path('busqueda', views.Busqueda.as_view(), name='busqueda'),
    path('gestionHotel', views.GestionHotel.as_view(), name='gestionHotel'),
    path('gestionLugar', views.GestionLugar.as_view(), name='gestionLugar'),
    path('gestionPaquete', views.PaqueteListView.as_view(), name='gestionPaquete'),
    path('agencia', views.Agencia.as_view(), name='agencia'),
    path('registro', views.RegistroPaqueteView.as_view(), name='registro'),
    path('registrarPaquete',views.PaqueteCreateView.as_view(), name='registrarPaquete'),
    path('gestionUsuario',views.UsuarioListView.as_view(), name='gestionUsuario'),
    path('gestionDetallePaquete',views.DetallePaqueteListView.as_view(), name='gestionDetallePaquete'),
    path('registrarUsuario',views.UsuarioCreateView.as_view(), name='registrarUsuario'),
    path('modificarUsuario/<int:pk>',views.UsuarioUpdateView.as_view(),name='modificarUsuario'),
    path('eliminarUsuario/<int:id>',views.eliminarUsuario,name='eliminarUsuario'),
    path('eliminarPaquete/<int:idPaquete>',views.eliminarPaquete,name='eliminarPaquete'),
    path('modificarPaquete/<int:pk>',views.PaqueteUpdateView.as_view(),name='modificarPaquete'),
    path('registrarDetallePaquete',views.DetallePaqueteCreateView.as_view(),name = 'registrarDetallePaquete'),
    path('upload',views.upload_image_view, name='upload'),
    
]

    # path('login',include('django.contrib.auth.urls'),name='login'),