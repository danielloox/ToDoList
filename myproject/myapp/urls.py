from django.urls import path
from .views import TaskList, PriorityList, TaskDetail, SubtaskList, SubtaskDetail

urlpatterns = [

    path('tasks/', TaskList.as_view()),
    path('tasks/<int:pk>/', TaskDetail.as_view()),

    path('tasks/subtasks/',SubtaskList.as_view()),
    path('tasks/subtasks/<int:pk>/',SubtaskDetail.as_view()),

    path('priors/', PriorityList.as_view()),

]
