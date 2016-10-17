#!/bin/sh
export JVM_OPTS="-Dcassandra -Dcassandra.config.loader=ZipkinConfigurationLoader -Djava.net.preferIPv4Stack=true\
             -Dcassandra.custom_tracing_class=com.thelastpickle.cassandra.tracing.ZipkinTracing\
             -Dcassandra.custom_query_handler_class=org.apache.cassandra.cql3.CustomPayloadMirroringQueryHandler\
             $ADDITIONAL_JVM_OPTS"
echo $JVM_OPTS
/cassandra/bin/cassandra -f
