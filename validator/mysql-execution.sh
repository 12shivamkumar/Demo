#!/bin/sh
ret=0
sudo /etc/init.d/mysql start
mysql -e 'SET GLOBAL sql_mode = NO_ZERO_DATE;' -uroot -proot
mysql -e 'CREATE DATABASE demo;' -uroot -proot
mysql -e 'SHOW DATABASES;' -uroot -proot
mysql -e 'use demo;' -uroot -proot
for i in $1
   do
   echo "$i"
   mysql -uroot -proot demo < $i || ret=1
   done
for i in $2
   do
   echo "$i"
   mysql -uroot -proot demo < $i || ret=1
   done


mysql -e 'DESCRIBE demo.employee;' -uroot -proot demo
mysql -e 'DESCRIBE demo.office;' -uroot -proot demo
mysql -e 'DESCRIBE demo.employees;' -uroot -proot demo
mysql -e 'DESCRIBE demo.employee_meeting;' -uroot -proot demo

exit $ret
