FROM mysql/mysql-server:5.7
RUN yum install nmap-ncat -y
ADD main.sql /src/
ADD connectionChecker.sh /src/
ADD memCheck.sh /src/
ADD cpuCheck.sh /src/
ADD dockerCheck.sh /src/
ADD my.cnf /etc/my.cnf
ADD start.sh /src
ADD start.sh /docker-entrypoint-initdb.d

EXPOSE 3306
