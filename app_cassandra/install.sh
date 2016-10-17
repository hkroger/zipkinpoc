#!/bin/sh
set -eu

echo "*** Installing Cassandra"
# DataStax only hosts 3.0 series at the moment
curl -SL http://archive.apache.org/dist/cassandra/$CASSANDRA_VERSION/apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz | tar xz
mv apache-cassandra-$CASSANDRA_VERSION/* /cassandra/
mv /cassandra_libs/* /cassandra/lib
rm -rf /cassandra_libs

echo "*** Changing to cassandra user"
adduser -S cassandra
chown -R cassandra /cassandra

echo "*** Image build complete"
