FROM python:3.11.3-alpine
#RUN apk add --no-cache curl
RUN mkdir /karandocker

WORKDIR /karandocker

# RUN pip install pip --upgrade

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
COPY . .

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

# COPY . /karandocker

EXPOSE 8000

#HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \

#CMD curl -f http://localhost:8000 || exit 1

CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]