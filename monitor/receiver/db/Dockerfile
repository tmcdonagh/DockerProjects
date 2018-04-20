FROM mysql

RUN apt update -qq 

WORKDIR /db

ADD . /db

RUN chmod +x /db/databaseRun.sh

EXPOSE 3306
