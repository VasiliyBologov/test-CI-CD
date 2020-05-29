#!/bin/sh
docker login  --username $DOCKER_USER --password $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $DOCK_REPO_NAME:$TAG .
docker tag $DOCK_REPO_NAME:$TAG $DOCKER_USER/$DOCK_REPO_NAME:$TAG
docker push vasiliybologov/$DOCK_REPO_NAME:$TAG