# FROM python:3.11.3-alpine
# #RUN apk add --no-cache curl


# WORKDIR /karandocker

# RUN pip install pip --upgrade

# COPY requirements.txt requirements.txt

# RUN pip install -r /requirements.txt

# COPY . /karandocker

# EXPOSE 8000

# #HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \

# #CMD curl -f http://localhost:8000 || exit 1

# CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]

FROM python:3.10.0-alpine3.15
ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY requirements.txt /app

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:80"]