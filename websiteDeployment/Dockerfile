FROM php:7.1.27-apache-stretch
ADD apache2.conf /etc/apache2/
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt update --fix-missing && apt install -qqy git vim nodejs && git clone https://github.com/tmcdonagh/WebsiteOverview.git && mv WebsiteOverview/* .
RUN npm install bootstrap
RUN docker-php-ext-install mysqli
EXPOSE  80

