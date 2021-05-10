#!/bin/sh

mkdir -p /var/lib/influxdb/data
mkdir -p /var/lib/influxdb/wal
mkdir -p /var/lib/influxdb/met

/usr/sbin/influxd & sleep 3
influx -execute "CREATE DATABASE grafana" 
influx -execute "CREATE USER graf_user WITH PASSWORD '1234'"
influx -execute "GRANT ALL ON grafana TO graf_user"

while sleep 60; do
    ps aux |grep influxd |grep -q -v grep
    PROCESS_1_STATUS=$?
    if [ $PROCESS_1_STATUS -ne 0 ];
    then
        echo "One of the processes has already exited."
        exit 1
    fi
done
