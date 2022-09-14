#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
sudo /etc/init.d/mysql start
mysql -e 'SET GLOBAL sql_mode = NO_ZERO_DATE;' -uroot -proot
mysql -e 'CREATE DATABASE test;' -uroot -proot
mysql -e 'SHOW DATABASES;' -uroot -proot
mysql -e 'use test;' -uroot -proot
mysql -e 'CREATE USER 'runner'@'localhost' IDENTIFIED BY 'runner@123';' -uroot -proot
mysql -e 'GRANT ALL PRIVILEGES ON *.* TO 'runner'@'localhost' WITH GRANT OPTION;' -uroot -proot
mysql -e 'FLUSH PRIVILEGES;' -uroot -proot

declare -a value
value=$2

echo $value


for i in $1
   do
   touch temp.sql
   git show $value:$i > temp.sql
   echo MASTER_SQL_FILE
   cat temp.sql
   echo
   echo TEST_SQL_FILE
   cat $i
   mysql-schema-diff --user=runner --password='runner@123' temp.sql $i | grep -c "DROP"
   done
exit $ret