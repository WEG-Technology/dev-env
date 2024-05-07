#!/bin/bash

CONTAINER_NAME = jekyll
setup:
	docker-compose up -d
restart:
	docker-compose restart
prepare: 	## Composer install
	docker exec -it ${CONTAINER_NAME} composer install
bash:
	docker exec -it ${CONTAINER_NAME} bash