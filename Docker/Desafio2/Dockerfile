FROM python:3.11-alpine
WORKDIR /app
COPY requirements.txt /app
run pip install -r requirements.txt
COPY . /app
CMD [ "gunicorn", "-b", "0.0.0.0:5000", "api:app" ]
