Open Message Queue (Open MQ) -- A complete JMS MOM Platform
https://javaee.github.io/openmq/

Download URL:
https://download.oracle.com/mq/open-mq/index.html

## Build Image

docker build . -t villim/openmq:5.1.2

## Run Docker Image: 

docker run  -ti villim/openmq:5.1.2
docker run -d -p 7676:7676 -p 7677:7677 -ti villim/openmq:5.1.2

docker run -p 7676:7676  --rm villim/openmq
docker run -d -p 7676:7676 -p 7677:7677 --rm villim/openmq

## Checking Message in Queue:
sh /usr/local/openmq/MessageQueue5_1_2/mq/bin/imqcmd list svc -u admin -passfile /usr/local/openmq/MessageQueue5_1_2/imq-passfile
sh /usr/local/openmq/MessageQueue5_1_2/mq/bin/imqcmd list dst -u admin -passfile /usr/local/openmq/MessageQueue5_1_2/imq-passfile



P.S.
Learned from:  https://hub.docker.com/r/seges/openmq
But changed base docker image, great reduce image size
