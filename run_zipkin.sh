#!/bin/bash
source config
docker-compose -f $DOCKER_ZIPKIN_DIR/docker-compose.yml -f $DOCKER_ZIPKIN_DIR/docker-compose-kafka.yml -f $DOCKER_ZIPKIN_DIR/docker-compose-cassandra.yml up

