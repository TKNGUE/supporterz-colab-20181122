
NETWORK_NAME=supporterz-loadtest2
N_THREADS=10
N_CONNECTION=10
up: 
	cd ./webserver/golang; make
	cd ./webserver/python/flask; make
	docker network create $(NETWORK_NAME)
	docker network connect $(NETWORK_NAME) golang
	docker network connect $(NETWORK_NAME) python-flask


test-by-wrk: 
	for server in golang python-flask; do \
	    echo "============ $$server ==============="; \
	    docker run -it \
		--network $(NETWORK_NAME) \
		--rm williamyeh/wrk \
		-t $(N_THREADS) \
		-c $(N_CONNECTION) \
		--latency \
		http://$$server:8080 \
		;\
	done

test-by-wrk2-uncorrected: 
	for server in golang python-flask; do \
	    echo "============ $$server ==============="; \
	    docker run -it \
	    --network $(NETWORK_NAME) \
	    --rm 1vlad/wrk2-docker \
	    -U \
	    -t $(N_THREADS) \
	    -c $(N_CONNECTION) \
	    -R 100 \
	    --latency \
	    http://$$server:8080 \
	    ;\
	done


test-by-wrk2-corrected: 
	for server in golang python-flask; do \
	    echo "============ $$server ==============="; \
	    docker run -it \
	    --network $(NETWORK_NAME) \
	    --rm 1vlad/wrk2-docker \
	    -t $(N_THREADS) \
	    -c $(N_CONNECTION) \
	    -R 100 \
	    --latency \
	    http://$$server:8080 \
	    ;\
	done


clean: 
	cd ./webserver/golang; make kill
	cd ./webserver/python/flask; make kill
	docker network rm $(NETWORK_NAME)
