# Generated by Django 3.0.7 on 2020-11-07 02:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='reservacion',
            options={},
        ),
        migrations.RenameField(
            model_name='reservacion',
            old_name='estadoVuelo',
            new_name='estadoReservacion',
        ),
        migrations.RemoveField(
            model_name='reservacion',
            name='hotel_reservacion',
        ),
        migrations.AddField(
            model_name='paquete',
            name='reservacion_paquete',
            field=models.ManyToManyField(blank=True, null=True, to='Reservacion.Reservacion', verbose_name='Reservacion'),
        ),
        migrations.AlterField(
            model_name='detallepaquete',
            name='paquete_detallePaquete',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Reservacion.Paquete'),
        ),
    ]