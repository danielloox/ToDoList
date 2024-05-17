from datetime import datetime

from django.db import models
from django.contrib.auth.models import User


class Task(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField(null=True)
    id_user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField(default=datetime.today().date())
    priority = models.ForeignKey('Priority', null=True, on_delete=models.SET_NULL)
    isDone = models.BooleanField(default=False)
    def __str__(self):
        return self.title


class Subtask(models.Model):
    title = models.CharField(max_length=100)
    isDone = models.BooleanField(default=False)
    id_task = models. ForeignKey('Task', null=True, on_delete=models.CASCADE)
    def __str__(self):
        return self.title


class Priority(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name
