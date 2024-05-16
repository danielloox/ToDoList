# Используйте образ Python в качестве базового образа
FROM python:3.7

# Установите переменную окружения для обеспечения выполнения кода в режиме неинтерактивной среды
ENV PYTHONUNBUFFERED 1

# Установите рабочую директорию в контейнере
WORKDIR /code/myproject

# Копируйте файлы зависимостей в контейнер и установите их
COPY requirements.txt /code/myproject
RUN pip install -r requirements.txt

# Копируйте остальные файлы проекта в контейнер
COPY .. /code/myproject

EXPOSE 8000

ENTRYPOINT ["python3"]
CMD ["/code/myproject/manage.py", "runserver", "0.0.0.0:8000"]