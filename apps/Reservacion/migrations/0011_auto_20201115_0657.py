# Generated by Django 3.0.7 on 2020-11-15 11:57

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0010_auto_20201113_2016'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reservacion',
            name='cuposReservacion',
            field=models.PositiveSmallIntegerField(blank=True, default=1, null=True, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(50)], verbose_name='Cupos (Personas)'),
        ),
    ]
