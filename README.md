solderra/armhf-docker-influxdb
=====================

InfluxDB image

Tags
----

    solderra/armhf-influxdb:latest -> influxdb 0.9.6.1

Running your InfluxDB image
---------------------------

Start your image binding the external ports `8083` and `8086` in all interfaces to your container. Ports `8090` and `8099` are only used for clustering and should not be exposed to the internet:

    docker run -d -p 8083:8083 -p 8086:8086 solderra/armhf-influxdb

`Docker` containers are easy to delete. If you delete your container instance and your cluster goes offline, you'll lose the InfluxDB store and configuration. If you are serious about keeping InfluxDB data persistently, then consider adding a volume mapping to the containers `/data` folder:

    docker run -d --volume=/var/influxdb:/data -p 8083:8083 -p 8086:8086 solderra/armhf-influxdb

Configuring your InfluxDB
-------------------------
Open your browser to access `localhost:8083` to configure InfluxDB. Fill the port which maps to `8086`. *There is no default user anymore in version 0.9 but you can set `auth-enabled: true` in the config.toml.*

Alternatively, you can use RESTful API to talk to InfluxDB on port `8086`. For example, if you have problems with the initial database creation for version `0.9.x`, you can use the new `influx` cli tool to configure the database. While the container is running, you launch the tool with the following command:

  ```
  docker exec -ti influxdb-container-name /opt/influxdb/influx
  Connected to http://localhost:8086 version 0.9.2.1
  InfluxDB shell 0.9.2.1
  >
  ```
