#!/bin/bash
#WIPES OUT EVERYTHING - CAVEAT EMPTOR!
#resets baikal install. deletes all folders and containers then rebuilds directories and permissions correctly
docker="/usr/bin/docker"

echo -e "------   Stopping all containers...  -------"
${docker} kill $(docker ps -q)

echo -e "------   Delete all containers...    -------"
${docker} rm $(docker ps -a -q)

echo -e "------   Delete all bind mounts...    -------"
sudo rm -rf /var/lib/baikal
sudo rm -rf /var/lib/baikal-data
sudo rm -rf /var/lib/baikal-data/data/*

echo -e "------   Delete all volumes...    -------"
${docker} volume rm $(docker volume ls -qf dangling=true)

echo -e "------   Create folders...    -------"
sudo mkdir /var/lib/baikal-data
sudo mkdir /var/lib/baikal-data/config
sudo mkdir /var/lib/baikal-data/data 
sudo mkdir /var/lib/baikal-data/data/db
sudo mkdir /var/lib/baikal
sudo chown -R 33:33 /var/lib/baikal

exit 0

