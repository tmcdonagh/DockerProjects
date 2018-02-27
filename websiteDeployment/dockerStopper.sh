#!/bin/bash

if [ $USER != root ]
then
  echo "Must be run as root"
  exit 1
fi
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

