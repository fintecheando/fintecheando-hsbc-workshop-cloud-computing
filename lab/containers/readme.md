# Login App - Docker - FinTECHeando

1. Just run Docker compose to get the Login App up and running.

```bash
$ docker-compose up
```

# Or build the images

1. Build the Login App image

```bash
$ docker build -t com.mx.fintecheando.demo.hsbc.login.app.0.0.1 .
```

2. Build the DB image 

```bash
$ docker build -t com.mx.fintecheando.demo.hsbc.login.db.0.0.1 .
```

3. Build the IBM MQ image

```bash
$ docker build -t com.mx.fintecheando.demo.hsbc.login.mq.0.0.1 .
```

5. Run the Docker images using Compose

```bash
$ docker-compose -f docker-compose.yml up
```

6. Verify the running containers

```bash
$ docker ps | grep demo.hsbc
```

7. Login to the app using the Web UI


8. As note if you have any issue with the volumes and entry points remove the volumes (be careful, with this we are removing all of them, because it is running in our local DEV, don't do this in Production)
```bash
$ docker stop $(docker ps -a -q)
$ docker rm $(docker ps -a -q)
$ docker volume rm $(docker volume ls -q)
```

Reference 

Issues with the reports
* https://stackoverflow.com/questions/37066024/what-is-the-mariadb-dialect-class-name-for-hibernate
* http://sterl.org/2015/09/spring-boot-mariadb/
* http://in.relation.to/2017/02/16/mariadb-dialects/
