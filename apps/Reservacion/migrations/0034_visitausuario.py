# Generated by Django 3.1.3 on 2020-12-01 01:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0033_auto_20201129_0857'),
    ]

    operations = [
        migrations.CreateModel(
            name='VisitaUsuario',
            fields=[
                ('usuario_visitas', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='Reservacion.usuario', verbose_name='Usuario que pertenece')),
                ('paquete_visitaUsuario', models.ManyToManyField(to='Reservacion.Paquete', verbose_name='Paquetes del Usuario que Calificaron')),
            ],
            options={
                'verbose_name': 'visitausuario',
                'verbose_name_plural': 'visitasusuarios',
            },
        ),
    ]
