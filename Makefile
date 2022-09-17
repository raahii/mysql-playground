# Makefile to show operation example
.PHONY: start, mysql, login, stop, restart

start:
	docker-compose up -d

mysql:
	docker-compose exec db mysql

login:
	docker-compose exec db bash

stop:
	docker-compose down --remove-orphans

restart: stop start
