#!/bin/sh

sed s/domain = localhost/"domain = ${IP_EXT}"/g /usr/share/grafana/conf/defaults.ini

grafana-server -homepath=/usr/share/grafana/ &

while sleep 60; do
    ps aux |grep grafana-server |grep -q -v grep
    PROCESS_1_STATUS=$?
    if [ $PROCESS_1_STATUS -ne 0 ];
    then
        echo "One of the processes has already exited."
        exit 1
    fi
done
