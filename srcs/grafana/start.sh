#!/bin/sh

sed s/";domain = localhost/domain = ${IP_EXT}" /usr/share/grafana/conf/defaults.ini

grafana-server -homepath=/usr/share/grafana/ &

tail -f /dev/null
