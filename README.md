# MySQL playground

MySQL server and golang application server for my own playground.

## setup

```sh
$ docker-compose up -d
[+] Running 3/3
 ⠿ Network mysql_default  Created                                                                                                                                                        0.0s
 ⠿ Container mysql-db-1   Started                                                                                                                                                        0.3s
 ⠿ Container mysql-app-1  Started

❯ docker-compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
mysql-app-1         "go run main.go"         app                 running             0.0.0.0:8080->8080/tcp
mysql-db-1          "docker-entrypoint.s…"   db                  running             3306/tcp, 33060/tcp
```

## How to use

This is an example.

1. set up database with MySQL official example (see [datacharmer/test_db](https://github.com/datacharmer/test_db) for detail)

  ```sh
  $ docker-compose exec db bash
  root@724acd58dccf:/home/sql#
  root@724acd58dccf:/home/sql# cd 00.mysql_official_sample/init
  root@724acd58dccf:/home/sql/00.mysql_official_sample/init# mysql < employees.sql
  CREATING DATABASE STRUCTURE
  storage engine: InnoDB
  LOADING departments
  LOADING employees
  LOADING dept_emp
  LOADING dept_manager
  LOADING titles
  LOADING salaries
  00:05:03
  ```

2. start MySQL console

  ```sh
  $ make mysql
  Creating mysql_client_run ... done
  
  root@localhost > select count(*) from employees.employees;
  +----------+
  | count(*) |
  +----------+
  |   300024 |
  +----------+
  ```


See Makefile for your information.


## Volumes
- `./sql` will be mounted to `/home/sql`
- `./conf` will be mounted to `/home/conf`
- `./data` persist mysql data

