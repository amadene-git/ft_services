#!/bin/sh

RUN /usr/sbin/influxd & sleep 3 &&\
influx -execute "CREATE DATABASE grafana" &&\
influx -execute "CREATE USER ljurdant WITH PASSWORD 'yo'" &&\
influx -execute "GRANT ALL ON grafana TO ljurdant" &\

while sleep 60; do
    ps aux |grep influxd |grep -q -v grep
    PROCESS_1_STATUS=$?
   # ps aux |grep telegraf |grep -q -v grep
   # PROCESS_2_STATUS=$?
    # If the greps above find anything, they exit with 0 status
    # If they are not both 0, then something is wrong
    if [ $PROCESS_1_STATUS -ne 0 ];
    then
        echo "One of the processes has already exited."
        exit 1
    fi
done
