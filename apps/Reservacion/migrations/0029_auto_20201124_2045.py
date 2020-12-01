# Generated by Django 3.0.7 on 2020-11-25 01:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0028_rating_paquete_rating'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='condicion',
            name='paquete_condicion',
        ),
        migrations.AddField(
            model_name='condicion',
            name='paquete_condicion',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Reservacion.Paquete', verbose_name='Condiciones'),
        ),
    ]
