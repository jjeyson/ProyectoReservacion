# Generated by Django 3.0.7 on 2020-11-22 05:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0021_auto_20201121_2331'),
    ]

    operations = [
        migrations.AlterField(
            model_name='condicion',
            name='tituloCondicion',
            field=models.CharField(choices=[('i', 'Incluida '), ('n', 'No Incluida ')], max_length=1, verbose_name='Tipo de Condicion'),
        ),
    ]