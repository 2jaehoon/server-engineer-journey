FROM python:3.11-slim

WORKDIR /app

RUN pip install mysql-connector-python

COPY app.py .

CMD ["python","-u", "app.py"]
