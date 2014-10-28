#!/bin/bash -eu

TARGET=$1
PORT=$2

echo "Building docker image..."

IMG_ID=$(docker build . | tail -1 | awk '{print($3)}')

echo "Running docker proxy to $TARGET:$PORT"

docker run -ti -p $PORT:$PORT \
  -e "TARGET=$TARGET" \
  -e "PORT=$PORT" \
  $IMG_ID
