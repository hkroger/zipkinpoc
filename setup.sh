#!/bin/bash
source config
mkdir -p $DOCKER_ZIPKIN_DIR
git clone https://github.com/openzipkin/docker-zipkin.git $DOCKER_ZIPKIN_DIR
git clone https://github.com/graphql-java/todomvc-relay-java.git $TODO_APP_DIR
