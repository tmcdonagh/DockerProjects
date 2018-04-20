FROM php:7.0-apache

RUN apt update -qq 
#RUN apt install -yqq --force-yes php-mysql
#RUN apt -qq install -y dialog
#RUN apt -qq install -y mariadb-client mariadb-server
#RUN apt -qq install -y php-mysql
#RUN DEBIAN_FRONTEND=noninteractive apt install -y mysql-server
RUN DEBIAN_FRONTEND=noninteractive apt install -y mysql-server mysql-common mysql-client

#mariadb-client mariadb-server

WORKDIR /receiver

ADD . /receiver

#RUN chmod +x /monitor/cpu.sh && chmod +x /monitor/tmux.sh

EXPOSE 80
