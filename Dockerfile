FROM bitnami/python:latest

#Install Dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

#Run application
COPY . /app/notes
WORKDIR /app/notes
EXPOSE 3000
RUN flask db init
RUN flask db migrate
RUN flask db upgrade

CMD ["flask", "run", "--port=80", "--host=0.0.0.0"]
