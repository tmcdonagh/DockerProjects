#!/bin/bash
./webInstaller.sh
cd clouddb
./clouddbInstaller.sh
cd updater
./updaterInstaller.sh
cd ..
./networkCreator.sh
cd ..
