CREATE USER 'test'@'%' IDENTIFIED WITH mysql_native_password BY 'test';
GRANT SELECT ON * . * TO 'test'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE clouddb;
USE clouddb;

CREATE TABLE logs(
  status VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL
);

CREATE TABLE cpu(
  perc VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL
);

CREATE TABLE mem(
  free VARCHAR(50) NOT NULL,
  total VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL
);
