from .models import Task, Priority, Subtask
from rest_framework import viewsets, generics

from .permissions import IsOwner
from .serializers import TaskSerializer, PrioritySerializer, SubtaskSerializer


class TaskList(generics.ListCreateAPIView):
    serializer_class = TaskSerializer
    permission_classes = [IsOwner]
    def get_queryset(self):
        queryset = Task.objects.filter(id_user=self.request.user)
        date = self.request.query_params.get('date')
        if date is not None:
            queryset = queryset.filter(date = date)
        return queryset

class TaskDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer
    permission_classes = [IsOwner]


class PriorityList(generics.ListCreateAPIView):
    queryset = Priority.objects.all()
    serializer_class = PrioritySerializer


class SubtaskList(generics.ListCreateAPIView):
    def get_queryset(self):
        queryset = Subtask.objects.filter(id_user=self.request.user)
        task = self.request.query_params.get('task')
        if task is not None:
            return queryset.filter(id_task = task)
        return []
    serializer_class = SubtaskSerializer
    permission_classes = [IsOwner]


class SubtaskDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Subtask.objects.all()
    serializer_class = SubtaskSerializer
    permission_classes = [IsOwner]