#!/bin/bash
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS mainDB;
                USE mainDB;
                CREATE TABLE percentages (
                  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                  time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                  perc INT(6)
                );"
