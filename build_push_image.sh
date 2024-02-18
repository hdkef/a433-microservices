#! /bin/bash

# if error do not return err immediately
set +e

# remove latest tag and ignore error log
docker rmi ghcr.io/hdkef/item-app:v1 2>/dev/null

# if error return err immediately, do not execute next line
set -e

# build image with tag from commit
docker build --tag "ghcr.io/hdkef/item-app:v1" .

# list all images
docker images

# push v1 images

# login to github container registry
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u hdkef11@gmail.com --password-stdin

# push images
docker push ghcr.io/hdkef/item-app:v1
