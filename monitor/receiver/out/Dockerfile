FROM php:7.0-apache

RUN apt update -qq 
RUN apt -qq install -y dialog
#RUN apt -qq install -y mariadb-client mariadb-server
RUN DEBIAN_FRONTEND=noninteractive apt install -y mysql-server

#mariadb-client mariadb-server

WORKDIR /receiver

ADD . /receiver

#RUN chmod +x /monitor/cpu.sh && chmod +x /monitor/tmux.sh

EXPOSE 80
