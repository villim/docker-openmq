#FROM java:8-jdk
FROM java:openjdk-8-jre-alpine
LABEL William Wang <william.wang@126.com>

ENV OPENMQ_VERSION 5.1.2
ENV OPENMQ_ARCHIVE openmq5_1_2.zip

# only need do apk with java:openjdk-8-jre-alpine
RUN apk update && \
	apk upgrade && \
	apk add bash && \
	# apk add curl && \ 
	apk add --update openssl && \
	apk add ca-certificates && update-ca-certificates && apk --no-cache add openssl wget && \
	rm -vrf /var/cache/apk/* && \
 	mkdir -p /usr/local/openmq/MessageQueue5_1_2 

# working with java:8-jdk
#RUN useradd -d /home/openmq -u 1001 -s /bin/bash openmq && \
#    chown -R openmq:openmq /usr/local/openmq
#USER openmq

COPY /config/imq-passfile /usr/local/openmq/MessageQueue5_1_2/imq-passfile

RUN cd /usr/local/openmq/MessageQueue5_1_2 && \
    # curl -v -L -o $OPENMQ_ARCHIVE http://download.oracle.com/mq/open-mq/$OPENMQ_VERSION/latest/$OPENMQ_ARCHIVE && \
	wget -O $OPENMQ_ARCHIVE http://download.oracle.com/mq/open-mq/$OPENMQ_VERSION/latest/$OPENMQ_ARCHIVE && \
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
