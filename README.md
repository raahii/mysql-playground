# MySQL playground

## server

```sh
$ docker-compose up -d server
$ dc ps
     Name                  Command             State          Ports
--------------------------------------------------------------------------
mysql_server_1   docker-entrypoint.sh mysqld   Up      3306/tcp, 33060/tcp
```

```sh

```

## client

```sh
$ docker-compose run client -it
Creating mysql_client_run ... done
root@server >
```
