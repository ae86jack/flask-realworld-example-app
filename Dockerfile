FROM python:3.7

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /app

WORKDIR /app

COPY requirements/prod.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY . .

EXPOSE 80

ENV FLASK_APP /app/autoapp.py
