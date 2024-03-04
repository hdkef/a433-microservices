#! /bin/bash

# build image
docker build --tag ghcr.io/hdkef/order-svc:latest .

#login ghcr
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u hdkef11@gmail.com --password-stdin

#push image
docker push ghcr.io/hdkef/order-svc:latest 

#remove docker image
docker rmi ghcr.io/hdkef/order-svc:latest