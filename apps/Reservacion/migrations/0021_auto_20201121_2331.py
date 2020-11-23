# Generated by Django 3.0.7 on 2020-11-22 04:31

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0020_auto_20201120_1022'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rating',
            name='paquete_Rating',
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='paqueteID',
        ),
        migrations.AddField(
            model_name='rating',
            name='paquete_usuario',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='disponibilidadPaquete',
            field=models.PositiveIntegerField(blank=True, default=150, null=True, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(150)], verbose_name='Numero de Cupos'),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='tituloPaquete',
            field=models.CharField(blank=True, max_length=250, null=True, unique=True, verbose_name='titulo del paquete'),
        ),
        migrations.AlterField(
            model_name='paquete',
            name='visitasPaquete',
            field=models.PositiveIntegerField(blank=True, default=0, null=True, verbose_name='Visitas'),
        ),
    ]
