FROM php:7.0-apache

RUN apt update -qq 

RUN apt -qq install -y dialog nodejs tmux

WORKDIR /receiver

ADD . /receiver
ADD webInterface/ /var/www/html

RUN chmod +x /receiver/updater.sh && chmod +x /receiver/tmux.sh


EXPOSE 80
