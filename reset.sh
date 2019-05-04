#!/usr/bin/env bash

docker rm $(docker ps -a -q)
sudo rm -rf  nginx grafana_data plugins influxdb
while true; do
    read -p "Do you wish to delete docker images as well (y/n)? " yn
    case $yn in
        [Yy]* ) docker rmi $(docker images -q); break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
