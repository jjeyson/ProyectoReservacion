# Generated by Django 3.0.7 on 2020-11-12 22:14

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0008_auto_20201108_2148'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='reservacion',
            name='cantidadDiasReservacion',
        ),
        migrations.AddField(
            model_name='reservacion',
            name='cuposReservacion',
            field=models.PositiveSmallIntegerField(blank=True, default=150, null=True, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(10)], verbose_name='Cupos (Personas)'),
        ),
    ]
