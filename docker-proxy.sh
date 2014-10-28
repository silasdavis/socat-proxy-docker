#!/bin/bash -eu

TARGET=$1
PORT=$2

docker run -p $PORT:$PORT \
  -e "TARGET=$TARGET" \
  -e "PORT=$PORT" \
  silasdavis/netcat-proxy-docker
