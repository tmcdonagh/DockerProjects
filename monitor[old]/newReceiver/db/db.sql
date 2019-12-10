CREATE DATABASE monitor;

GRANT ALL PRIVILEGES
ON monitor.*
TO 'tom'@'localhost'
IDENTIFIED BY 'password'
WITH GRANT OPTION;

GRANT ALL PRIVILEGES
ON monitor.*
TO 'tom'@'%'
IDENTIFIED BY 'password'
WITH GRANT OPTION;

USE monitor;
