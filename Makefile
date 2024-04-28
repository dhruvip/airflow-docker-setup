.PHONY: clean-all
clean-all:
	$(info --- clean all images and volumes)
	docker-compose -f docker-compose.yaml down --volumes --rmi all
	rm -rf logs/ *.pid *.cfg webserver_config.py

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
	mkdir -p logs plugins dags config
	source ./.env

.PHONY: reload
reload:
	$(info -- reload)
	@docker container restart $$(docker ps -aqf "name=scheduler_1$$") $$(docker ps -aqf "name=worker_1$$")

.PHONY: build
build:
	$(info --- docker compose down)
	docker build -t mycustomimage .