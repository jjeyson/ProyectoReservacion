# Generated by Django 3.0.7 on 2020-11-07 03:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0003_auto_20201106_2154'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='detallepaquete',
            options={'verbose_name': 'Detalle del Paquete', 'verbose_name_plural': 'Detalles del Paquete'},
        ),
        migrations.AlterModelOptions(
            name='reservacion',
            options={'verbose_name': 'Reservacion', 'verbose_name_plural': 'Reservaciones'},
        ),
        migrations.AlterModelOptions(
            name='usuario',
            options={'verbose_name': 'Usuario', 'verbose_name_plural': 'Usuarios'},
        ),
        migrations.RenameField(
            model_name='reservacion',
            old_name='pension',
            new_name='precioReservacion',
        ),
    ]
