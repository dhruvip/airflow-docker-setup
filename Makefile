.PHONY: clean-all
clean-all:
	$(info --- clean all images and volumes)
	docker-compose -f docker-compose.yaml down --volumes --rmi all
	rm -rf logs/ database/ *.pid *.cfg webserver_config.py

.PHONY: clean
clean:
	$(info --- docker compose down)
	docker-compose -f docker-compose.yaml down
	rm -rf *.pid *.cfg webserver_config.py

.PHONY: up
up:
	$(info --- docker compose up)
	docker-compose -f docker-compose.yaml up

.PHONY: init
init:
	$(info --init)
	mkdir -p logs plugins dags
	sudo chown 50000:0 dags logs plugins

.PHONY: run
run: init up

