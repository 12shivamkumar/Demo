#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl

sudo /etc/init.d/mysql start
mysql -e 'SET GLOBAL sql_mode = NO_ZERO_DATE;' -uroot -proot
mysql -e 'CREATE USER 'runner'@'localhost' IDENTIFIED BY '123';' -uroot -proot

echo $1

echo $2

for i in $1
   do
   echo "$i"
   mysql-schema-diff schema/validate/one.sql schema/validate/third.sql
   done

exit $ret