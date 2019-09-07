CREATE USER 'test'@'%' IDENTIFIED WITH mysql_native_password BY 'test';
GRANT SELECT ON * . * TO 'test'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE clouddb;
USE clouddb;

CREATE TABLE logs(
  ID int NOT NULL AUTO_INCREMENT,
  status VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE cpu(
  ID int NOT NULL AUTO_INCREMENT,
  perc VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE mem(
  ID int NOT NULL AUTO_INCREMENT,
  free VARCHAR(50) NOT NULL,
  available VARCHAR(50) NOT NULL,
  total VARCHAR(50) NOT NULL,
  time VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);
