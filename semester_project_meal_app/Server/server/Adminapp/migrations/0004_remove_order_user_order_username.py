# Generated by Django 5.1.4 on 2025-01-08 04:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Adminapp', '0003_order'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='user',
        ),
        migrations.AddField(
            model_name='order',
            name='username',
            field=models.CharField(default='mujtaba', max_length=150),
        ),
    ]
