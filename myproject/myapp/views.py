from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly, IsAdminUser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken

from .models import Task, Priority, Subtask
from rest_framework import viewsets, generics

from .permissions import IsOwner, IsAdminOrReadOnly
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
    permission_classes = [IsAdminOrReadOnly]


class PriorityDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Priority.objects.all()
    serializer_class = PrioritySerializer
    permission_classes = [IsAdminUser]





class SubtaskList(generics.ListCreateAPIView):
    serializer_class = SubtaskSerializer
    permission_classes = [IsOwner]

    def get_queryset(self):
        queryset = Subtask.objects.all()
        task = self.request.query_params.get('task_id')
        if task is not None:
            queryset = queryset.filter(id_task = task)
        return queryset
