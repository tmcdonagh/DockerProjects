CREATE USER 'test'@'%' IDENTIFIED WITH mysql_native_password BY 'test';
GRANT SELECT, INSERT, DELETE ON * . * TO 'test'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE db-wordpress;
USE db-wordpress;
