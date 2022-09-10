# MySQL playground

## setup

```sh
$ docker-compose up -d
[+] Running 2/2
 ⠿ Network mysql_default     Created                                                                                                                                0.0s
 ⠿ Container mysql-server-1  Started                                                                                                                                0.3s

$ docker-compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
mysql-server-1      "docker-entrypoint.s…"   server              running             3306/tcp, 33060/tcp
```

## how to use

- run from file

  ```sh
  $ docker-compose exec server bash
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

- prompt

  ```sh
  $ docker-compose exec server mysql
  Creating mysql_client_run ... done

  root@localhost > select count(*) from employees.employees;
  +----------+
  | count(*) |
  +----------+
  |   300024 |
  +----------+
  ```

See Makefile for your information.


## volumes
- `./sql` will be mounted to `/home/sql`
- `./conf` will be mounted to `/home/conf`
- `./data` persist mysql data

