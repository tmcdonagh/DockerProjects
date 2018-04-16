FROM php:7.0-apache

RUN apt update -qq 
RUN apt -qq install -y sysstat dialog tmux

WORKDIR /sender

ADD . /sender

RUN chmod +x /sender/cpu.sh && chmod +x /sender/tmux.sh

EXPOSE 80
