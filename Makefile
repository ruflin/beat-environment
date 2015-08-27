
update:
	git submodule update

build:
	docker-compose build

run: build
	docker-compose up
	
stop:
	docker-compose stop

setup-topbeat:
	sleep 15	# Waiting for elasticsearch to start
	curl -XPUT 'http://elasticsearch:9200/_template/topbeat' -d@/beat/etc/topbeat.template.json
	curl -XPUT 'http://elasticsearch:9200/.kibana/config/4.1.1' -d@/beat/etc/kibana-default-index.json
	curl -XPUT 'http://elasticsearch:9200/.kibana/index-pattern/topbeat-*' -d@/beat/etc/kibana-topbeat-index.json
	
run-topbeat: setup-topbeat
	/go/src/github.com/elastic/topbeat/topbeat -c etc/topbeat.env.yml