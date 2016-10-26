#!/bin/bash
source config

WEBXML=web/src/main/webapp/WEB-INF/web.xml

cd $TODO_APP_DIR

gsed -i -r "/ZipkinKafkaBootstrapServers/{\
    n; s/([0-9]{1,3}.){3}[0-9]{1,3}/$NET_IP/\
}" $WEBXML


# Do some cassandra setup
docker exec app_cassandra /cassandra/bin/nodetool settraceprobability 1.0
docker cp schema.cql app_cassandra:/schema.cql
docker exec app_cassandra /cassandra/bin/cqlsh -f /schema.cql

./gradlew :web:jettyRun
