FROM php:7.0-apache

RUN apt update -qq 
RUN apt -qq install -y sysstat dialog tmux

WORKDIR /monitor

ADD . /monitor

RUN chmod +x /monitor/cpu.sh && chmod +x /monitor/tmux.sh

#RUN bash -c /monitor/cpu.sh

EXPOSE 80
