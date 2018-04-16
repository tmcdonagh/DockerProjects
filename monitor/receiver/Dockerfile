FROM php:7.0-apache

RUN apt update -qq 
RUN apt -qq install -y dialog tmux mysql

WORKDIR /receiver

ADD . /receiver

#RUN chmod +x /monitor/cpu.sh && chmod +x /monitor/tmux.sh

EXPOSE 80
