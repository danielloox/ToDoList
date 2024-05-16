from django.contrib import admin
from .models import Task, Priority, Subtask

admin.site.register(Task)
admin.site.register(Priority)
admin.site.register(Subtask)