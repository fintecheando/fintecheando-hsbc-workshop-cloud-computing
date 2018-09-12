# Spring Security Login Tutorial



           

Tutorial

https://medium.com/@gustavo.ponce.ch/spring-boot-spring-mvc-spring-security-mysql-a5d8545d837d

1. docker run --env LICENSE=accept --env MQ_QMGR_NAME=QM1 --publish 1414:1414 --publish 9443:9443 --detach ibmcom/mq
2. docker run -p 3306:3306 --name some-mysql -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=login -d mysql:latest
3. mvn clean
4. mvn clean install
5. Go to the target folder
6. java -jar login-0.0.1-SNAPSHOT.jar 

7. Test these links

- http://localhost:8080/registration
- http://localhost:8080/login
