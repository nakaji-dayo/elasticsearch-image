#!/bin/bash

VERSION=`cat ./src/main/resources/plugin-descriptor.properties | egrep ^version= | cut -d = -f 2`
NAME=elasticsearch-image-${VERSION}
USER="nakaji-dayo"
REPO="elasticsearch-image"

# create description

# create release
github-release release \
  --user $USER \
  --repo $REPO \
  --tag $VERSION \
  --name $NAME \
  --description "not release"

github-release upload \
  --user $USER \
  --repo $REPO \
  --tag $VERSION \
  --name ${NAME}.zip \
  --file ./target/releases/${NAME}.zip

