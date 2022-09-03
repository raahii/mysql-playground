# Makefile to show operation example
.PHONY: start, prompt, login

start:
	docker-compose up -d

mysql:
	docker-compose exec server mysql

login:
	docker-compose exec server bash

stop:
	docker-compose down --remove-orphans

restart: stop start
