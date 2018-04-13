FROM php:7.0-apache

RUN apt update -qq 
RUN apt -qq install -y sysstat

WORKDIR /monitor

ADD . /monitor

RUN /monitor/./cpu.sh

EXPOSE 80
