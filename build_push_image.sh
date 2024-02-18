#! /bin/bash

# build image with tag from commit
docker build --tag "item-app:v1" .

# list all images
docker images

# tag image
docker tag item-app:v1 ghcr.io/hdkef/item-app:v1

# push v1 images

# login to github container registry
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u hdkef11@gmail.com --password-stdin

# push images
docker push ghcr.io/hdkef/item-app:v1
