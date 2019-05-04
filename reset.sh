#!/usr/bin/env bash

ids=$(docker ps -a -q)
for id in $ids
do
  echo "$id"
  docker stop $id && docker rm $id
done

while true; do
    read -p "Do you wish to delete docker images as well (y/n)? " yn
    case $yn in
        [Yy]* ) docker rmi $(docker images -q); break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo rm -rf  nginx grafana_data plugins influxdb
