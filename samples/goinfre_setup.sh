#!/bin/zsh

/goinfre/$USER/docker

cp -r ~/.docker /goinfre/$USER/docker


#echo "export MACHINE_STORAGE_PATH=/goinfre/$USER/docker"

#curl -Lo /goinfre/$USER/dockerThings/cache/boot2docker.iso https://github.com/boot2docker/boot2docker/releases/download/v1.9.1/boot2docker.iso

docker-machine create inception

eval $(docker-machine env inception)