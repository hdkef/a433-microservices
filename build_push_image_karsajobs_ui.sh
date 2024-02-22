#! /bin/bash

#if error do not execute next line
set -e

# build image
docker build -f=Dockerfile --tag=ghcr.io/hdkef/karsajobs-ui:latest  .

# login to container registry
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u hdkef11@gmail.com --password-stdin

# push image to container registry
docker push ghcr.io/hdkef/karsajobs-ui:latest