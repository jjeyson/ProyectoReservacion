# Generated by Django 3.0.7 on 2020-11-15 21:49

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0011_auto_20201115_0657'),
    ]

    operations = [
        migrations.CreateModel(
            name='Rating',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('scoreRating', models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(5)], verbose_name='Valoracion')),
                ('fechaCreacionRating', models.DateTimeField(auto_now_add=True, verbose_name='Fecha de Creación')),
                ('estadoRating', models.BooleanField(default=True, verbose_name='Activo')),
                ('paquete_Rating', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='Reservacion.Paquete')),
            ],
        ),
    ]
