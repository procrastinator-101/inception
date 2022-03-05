# !/bin/zsh

USB=/Volumes/TOSHIBA


cp -r -p ~/.docker $USB/docker


export MACHINE_STORAGE_PATH=$USB/docker

echo "export MACHINE_STORAGE_PATH=$USB/docker"

# curl -Lo $USB/docker/cache/boot2docker.iso https://github.com/boot2docker/boot2docker/releases/download/v1.9.1/boot2docker.iso

docker-machine create inception

eval $(docker-machine env inception)