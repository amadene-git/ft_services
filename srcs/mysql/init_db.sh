#/bin/sh

until mysql
do
	sleep 0.5
done

mysql -u root -e "DROP DATABASE test;"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -u root -e "GRANT ALL ON *.* TO 'mysql'@'%' IDENTIFIED BY '1234' WITH GRANT OPTION;"
mysql -u root -e "GRANT ALL ON wordpress.* TO 'user'@'%' IDENTIFIED BY '1234' WITH GRANT OPTION;"
mysql wordpress -u root < /root/wordpress.sql

