docker exec app_cassandra /cassandra/bin/nodetool setlogginglevel com.thelastpickle TRACE
docker exec app_cassandra /cassandra/bin/nodetool setlogginglevel ROOT TRACE
docker exec app_cassandra /cassandra/bin/nodetool setlogginglevel org.apache.cassandra.tracing TRACE
docker exec app_cassandra /cassandra/bin/nodetool setlogginglevel org.apache.cassandra.transport TRACE
docker exec app_cassandra /cassandra/bin/nodetool setlogginglevel org.apache.cassandra.service TRACE
docker exec -it app_cassandra tail -f /cassandra/logs/debug.log
