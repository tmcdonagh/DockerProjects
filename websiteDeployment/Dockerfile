FROM php:7.0-apache

RUN apt update -qq && apt -qq install -y git && git clone https://github.com/tmcdonagh/WebsiteOverview.git && mv WebsiteOverview/* .
RUN apt install -qqy vim

EXPOSE  80

