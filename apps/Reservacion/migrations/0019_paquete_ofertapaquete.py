# Generated by Django 3.0.7 on 2020-11-20 14:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0018_paquete_fechacreacionpaquete'),
    ]

    operations = [
        migrations.AddField(
            model_name='paquete',
            name='ofertaPaquete',
            field=models.BooleanField(blank=True, default=True, null=True, verbose_name='Oferta'),
        ),
    ]
