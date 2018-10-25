FROM php:7.1.2-apache 
RUN apt update -qq && apt -qq install -y git && git clone https://github.com/tmcdonagh/WebsiteOverview.git && mv WebsiteOverview/* .
RUN apt install -qqy vim
RUN docker-php-ext-install mysqli
EXPOSE  80

