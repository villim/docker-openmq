FROM java:8-jdk
#FROM java:openjdk-8-jre-alpine
MAINTAINER William Wang <william.wang@126.com>

ENV OPENMQ_VERSION 5.1.2
ENV OPENMQ_ARCHIVE openmq5_1_2.zip


RUN mkdir -p /usr/local/openmq/MessageQueue5_1_2 

RUN useradd -d /home/openmq -u 1001 -s /bin/bash openmq && \
    chown -R openmq:openmq /usr/local/openmq
USER openmq

ADD /config/imq-passfile /usr/local/openmq/MessageQueue5_1_2/imq-passfile

RUN cd /usr/local/openmq/MessageQueue5_1_2 && \
    curl -v -L -o $OPENMQ_ARCHIVE http://download.oracle.com/mq/open-mq/$OPENMQ_VERSION/latest/$OPENMQ_ARCHIVE && \
    unzip $OPENMQ_ARCHIVE

# when need over write configurations
#ADD /config/default.properties /usr/local/openmq/MessageQueue5_1_2/mq/lib/props/broker/default.properties
#ADD /config/config.properties /usr/local/openmq/MessageQueue4_5/var/mq/instances/imqbroker/props/config.properties

# portmapper & broker
EXPOSE 7676

# jms service
#EXPOSE 7677

# ssljms service
#EXPOSE 7678

# admin service
#EXPOSE 7679

# ssladmin service
#EXPOSE 7680

CMD ["/usr/local/openmq/MessageQueue5_1_2/mq/bin/imqbrokerd", "-vmargs", "-Xss64m"]
