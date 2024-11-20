FROM ubuntu:20.04

RUN apt update && apt upgrade && \
    apt install -y python3 python3-pip && \
    pip3 install django


COPY myapp /

WORKDIR /myapp

RUN python3 manage.py makemigrations

RUN python3 manage.py migrate

EXPOSE 8000

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]