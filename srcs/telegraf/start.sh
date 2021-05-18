#!/bin/sh

./telegraf-1.17.2/usr/bin/telegraf --config /etc/telegraf/telegraf.conf &

while sleep 60; do
    ps aux |grep telegraf |grep -q -v grep
    PROCESS_1_STATUS=$?
    if [ $PROCESS_1_STATUS -ne 0 ];
    then
        echo "One of the processes has already exited."
        exit 1
    fi
done
