CREATE USER 'test'@'%' IDENTIFIED WITH mysql_native_password BY 'test';
GRANT CREATE, UPDATE, SELECT, INSERT, DELETE ON * . * TO 'test'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE dbwordpress;
USE dbwordpress;
