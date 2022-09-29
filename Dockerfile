FROM bitnami/python:latest

#Install Dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install python-dotenv

#Run application
COPY . /app/notes
WORKDIR /app/notes
EXPOSE 3000

CMD ["flask", "run", "--port=3000", "--host=0.0.0.0"]
