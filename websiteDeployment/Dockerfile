FROM php:7.0-apache

RUN apt update -qq && apt -qq install -y git && git clone https://github.com/tmcdonagh/WebsiteOverview.git && mv WebsiteOverview/* .
RUN apt install -qqy vim
#RUN git clone https://github.com/tmcdonagh/ArchInstaller.git && mkdir /var/www/html/arch && mv ArchInstaller/* /var/www/html/arch && chmod 775 -R arch

EXPOSE  80

