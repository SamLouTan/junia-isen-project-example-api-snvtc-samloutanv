FROM python:3.10

WORKDIR /app

COPY ./api/* .

# Installer les dépendances Python directement dans le Dockerfile
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]