#! /bin/bash

# if error return err immediately, do not execute next line
set -e

# get latest commit sha

echo "latest commit sha256:"
git log -1 --format="%H"
commitsha=$(git log -1 --format="%H")

# build image with tag from commit
docker build --tag "ghcr.io/hdkef/item-app:$commitsha" .

# list all images
docker images

# if error do not return err immediately
set +e

# remove latest tag and ignore error log
docker rmi ghcr.io/hdkef/item-app:latest 2>/dev/null

# if error return err immediately, do not execute next line
set -e

# create latest tag from image with tag from commit
docker tag "ghcr.io/hdkef/item-app:$commitsha" "ghcr.io/hdkef/item-app:latest"

# push latest images

# login to github container registry
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u hdkef11@gmail.com --password-stdin

# push images
docker push ghcr.io/hdkef/item-app:latest
