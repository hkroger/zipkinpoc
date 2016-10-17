#!/bin/bash
source config

if ! which -s git; then
    echo You need to have git installed
    exit 1
fi

if ! which -s mvn; then
    echo You need to have mvn installed
    exit 1
fi


mkdir -p $DOCKER_ZIPKIN_DIR
mkdir -p $TODO_APP_DIR
mkdir -p $CASSANDRA_ZIPKIN_DIR

[ ! -d $DOCKER_ZIPKIN_DIR/.git ] && git clone https://github.com/openzipkin/docker-zipkin.git $DOCKER_ZIPKIN_DIR
[ ! -d $TODO_APP_DIR/.git ] && git clone https://github.com/bmuschko/todo.git $TODO_APP_DIR
[ ! -d $CASSANDRA_ZIPKIN_DIR/.git ] && git clone https://github.com/hkroger/cassandra-zipkin-tracing.git $CASSANDRA_ZIPKIN_DIR

git -C $DOCKER_ZIPKIN_DIR pull
git -C $TODO_APP_DIR pull
git -C $TODO_APP_DIR checkout gradle-2.x
git -C $CASSANDRA_ZIPKIN_DIR checkout cassandra-3.9

pushd $CASSANDRA_ZIPKIN_DIR
mvn package
popd 

cp $CASSANDRA_ZIPKIN_DIR/target/*.jar $APP_CASSANDRA_DIR

