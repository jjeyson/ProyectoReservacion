# Generated by Django 3.0.7 on 2020-11-15 23:44

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Reservacion', '0015_auto_20201115_1839'),
    ]

    operations = [
        migrations.AlterField(
            model_name='rating',
            name='scoreRating',
            field=models.PositiveSmallIntegerField(blank=True, default=1, null=True, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(5)], verbose_name='Valoracion'),
        ),
    ]
