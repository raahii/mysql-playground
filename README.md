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
  root@724acd58dccf:/home/sql# cd mysql-official-test-db/
  root@724acd58dccf:/home/sql/mysql-official-test-db# mysql < employees.sql
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


## volumes
- `./sql` will be mounted to `/home/sql`
- `./conf` will be mounted to `/home/conf`
- `./data` persist mysql data

