#!/usr/bin/env bash

set -e

CURRENT_DIR=$(pwd)
echo "CURRENT_DIR=$CURRENT_DIR"

docker-compose -f ./docker-compose.yml stop minio
docker-compose -f ./docker-compose.yml rm -f minio
docker-compose -f docker-compose.yml up -d minio redis mongo

sleep 20

mkdir ./minio/data/mini-monix-platform/feeder-data/
cp ./feeder/src/test/resources/fraudsters.txt ./minio/data/mini-monix-platform/feeder-data/fraudsters.txt
echo -e "Docker ps."
docker ps

