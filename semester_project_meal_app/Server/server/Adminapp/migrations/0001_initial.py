# Generated by Django 5.1.4 on 2025-01-06 13:35

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('description', models.TextField(max_length=200)),
                ('price', models.DecimalField(decimal_places=5, max_digits=5)),
                ('image', models.ImageField(upload_to='images/')),
            ],
        ),
    ]