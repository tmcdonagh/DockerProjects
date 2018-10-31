#!/bin/bash
docker build -t clouddb .
docker run --name=clouddb --restart=always -e MYSQL_ROOT_PASSWORD=test -d -p 2162:3306 clouddb

