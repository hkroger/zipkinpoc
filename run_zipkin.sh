#!/bin/bash
source config
sed -i "" "s/KAFKA_ADVERTISED_HOST_NAME=.*/KAFKA_ADVERTISED_HOST_NAME=$NET_IP/g" $DOCKER_ZIPKIN_DIR/docker-compose-kafka.yml
docker-compose -f $DOCKER_ZIPKIN_DIR/docker-compose.yml -f $DOCKER_ZIPKIN_DIR/docker-compose-kafka.yml -f $DOCKER_ZIPKIN_DIR/docker-compose-cassandra.yml up

