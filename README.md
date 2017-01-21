nicolaimainiero/armhf-docker-influxdb
=====================

InfluxDB image

Tags
----

    nmainiero/armhf-docker-influxdb:latest -> influxdb 1.11.0

Running your InfluxDB image
---------------------------

Start your image binding the external ports `8083` and `8086` in all interfaces to your container. Ports `8090` and `8099` are only used for clustering and should not be exposed to the internet:

    docker run -d -p 8083:8083 -p 8086:8086 nmainiero/armhf-docker-influxdb

`Docker` containers are easy to delete. If you delete your container instance and your cluster goes offline, you'll lose the InfluxDB store and configuration. If you are serious about keeping InfluxDB data persistently, then consider adding a volume mapping to the containers `/data` folder:

    docker run -d --volume=/var/influxdb:/data -p 8083:8083 -p 8086:8086 nmainiero/armhf-docker-influxdb

Configuring your InfluxDB
-------------------------
Open your browser to access `localhost:8083` to configure InfluxDB. Fill the port which maps to `8086`.

Alternatively, you can use RESTful API to talk to InfluxDB on port `8086`.
