#!/bin/bash

VERSION=$1
if [ -z "$VERSION" ]; then
    echo "Building: latest"
    TAG=latest
else
    echo "Building: $VERSION"
    TAG=$VERSION
fi
# Build
docker build .. -t imrehg/xmr-node-proxy:${TAG}   --build-arg PROXY_VERSION=${VERSION}
# Push
docker push imrehg/xmr-node-proxy:${TAG}
