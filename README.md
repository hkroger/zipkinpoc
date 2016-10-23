# Openzipkin PoC

![Alt text](diagram.png?raw=true "Diagram")

# Installation

Execute one-time setup:
	
	./setup.sh
	
# To run

Run this in a separate window: 

	./run_zipkin.sh

And in another this:

	./run_app_cassandra.sh

After that has started properly (`cqlsh 127.0.0.1 9043` connects to cassandra), you need to run this to enable tracing in Cassandra:

	docker exec app_cassandra /cassandra/bin/nodetool settraceprobability 1.0
