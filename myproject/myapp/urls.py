from django.urls import path, include, re_path
from .views import TaskList, PriorityList, TaskDetail, PriorityDetail, SubtaskList

urlpatterns = [

    path('tasks/', TaskList.as_view()),
    path('tasks/<int:pk>/', TaskDetail.as_view()),
    path('tasks/subtasks/',SubtaskList.as_view()),

    path('priors/', PriorityList.as_view()),
    path('priors/<int:pk>/', PriorityDetail.as_view()),
]
