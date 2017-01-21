FROM armhf/alpine
MAINTAINER Nicolai Mainiero

ENV INFLUXDB_VERSION 1.1.1

# GET curl
RUN apk update && apk upgrade && \
    apk add --no-cache curl bash

# GET official InfluxDB build for ARM
RUN cd ~ \
	&& curl -O https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}_linux_armhf.tar.gz \
  && tar xvfz influxdb-${INFLUXDB_VERSION}_linux_armhf.tar.gz \
	&& cp -R influxdb-${INFLUXDB_VERSION}-1/* /


COPY default.config  /etc/influxdb/default.config
COPY run.sh /run.sh
RUN chmod +x /*.sh

ENV PRE_CREATE_DB **None**
ENV SSL_SUPPORT **False**
ENV SSL_CERT **None**

# Admin server WebUI
EXPOSE 8083

# HTTP API
EXPOSE 8086

# Raft port (for clustering, don't expose publicly!)
#EXPOSE 8090

# Protobuf port (for clustering, don't expose publicly!)
#EXPOSE 8099

VOLUME ["/var/lib/influxdb"]

CMD ["/run.sh"]
