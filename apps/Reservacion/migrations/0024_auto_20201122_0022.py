# Generated by Django 3.0.7 on 2020-11-22 05:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0023_auto_20201122_0020'),
    ]

    operations = [
        migrations.AddField(
            model_name='condicion',
            name='tipoCondicion',
            field=models.CharField(blank=True, choices=[('i', 'Incluida '), ('n', 'No Incluida ')], max_length=1, null=True, verbose_name='Tipo de Condicion'),
        ),
        migrations.AlterField(
            model_name='condicion',
            name='tituloCondicion',
            field=models.CharField(blank=True, max_length=250, null=True, verbose_name='Tipo de Condicion'),
        ),
    ]
