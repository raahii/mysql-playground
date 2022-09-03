# Makefile to show operation example
.PHONY: start-mysql-server start-mysql-prompt

start-mysql-server:
	docker-compose up -d server

start-mysql-prompt:
	docker-compose run client -it
