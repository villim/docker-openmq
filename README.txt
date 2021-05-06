Open Message Queue (Open MQ) -- A complete JMS MOM Platform
https://javaee.github.io/openmq/

Download URL:
https://download.oracle.com/mq/open-mq/index.html


Run Docker Image: 
docker run --rm -ti villim/openmq:5.1.2

Checking Message in Queue:
sh /usr/local/openmq/MessageQueue5_1_2/mq/bin/imqcmd list svc -u admin -passfile /usr/local/openmq/imq-passfile
