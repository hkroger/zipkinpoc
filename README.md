# OpenZipkin PoC

Motivation of this small project was to test Zipkin by setting up a test environment where multiple parts of an application would report to [Zipkin](http://zipkin.io/) in different phases of request execution.

![Overall picture of the application](openzipkinpoc.png?raw=true "Diagram")

## The components

### Application

- Google chrome + Zipkin plugin
- [Todo App](https://github.com/hkroger/todo) (forked from [https://github.com/bmuschko/todo](https://github.com/bmuschko/todo))
	- Added Cassandra storage
	- Added Zipkin instrumentation
- Cassandra
	- Patched version of 3.X snapshot because [CASSANDRA-11706](https://issues.apache.org/jira/browse/CASSANDRA-11706) and [CASSANDRA-12835](https://issues.apache.org/jira/browse/CASSANDRA-12835)
	- With [Cassandra Zipkin Tracing](https://github.com/hkroger/cassandra-zipkin-tracing) (forked from [https://github.com/thelastpickle/cassandra-zipkin-tracing/network](https://github.com/thelastpickle/cassandra-zipkin-tracing/network))
	- Docker image

### Zipkin

Official [Zipkin docker](https://github.com/openzipkin/docker-zipkin.git) setup configured with:

- Kafka as transport
- Cassandra as storage

# Installation

Currently the scripts assume that you are running under Mac OS X and that you have certain prerequisites installed (making it run under Linux would not be a big problem).

Install prerequisites:

1. Install [Homebrew](http://brew.sh/)
2. Run following command

        brew install gnu-sed cassandra maven git

Execute one-time setup to download and compile cassandra zipkin module, zipkin docker compose scripts and the todo application used for testing:
	
	./setup.sh
	
Optional: Install [Google Chrome zipkin plugin](https://chrome.google.com/webstore/detail/zipkin-chrome-extension/jdpmaacocdhbmkppghmgnjmfikeeldfe?hl=en-GB) or 
	
# To run everything

Run this. It will start Zipkin + Kafka + Cassandra: 

	./run_zipkin.sh

In another console run this. This will create another instance of Cassandra accessible in the port 9043 (normally Cassandra uses 9042):

	./run_app_cassandra.sh

After you have confirmed that application cassandra is up, run the app (this will create schema and everything):

    ./run_app.sh
    
Application is now running at [http://localhost:8080/web](http://localhost:8080/web).

Zipkin UI is running at [http://localhost:9411/](http://localhost:9411/)

Optional: [Configure Google Chrome Zipkin plugin](https://github.com/openzipkin/zipkin-browser-extension/blob/master/docs/README.md).