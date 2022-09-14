#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
echo
sudo systemctl start mysql
echo
sudo systemctl status mysql
echo

mysql -e 'CREATE USER 'runner'@'localhost' IDENTIFIED BY 'runner123';' -uroot -proot
mysql -e 'GRANT ALL PRIVILEGES ON *.* TO 'runner'@'localhost' WITH GRANT OPTION;' -uroot -proot
mysql -e 'FLUSH PRIVILEGES;' -uroot -proot

declare -a value
value=$2

echo $value


for i in $1
   do
   touch temp.sql
   echo $value~
   git show $value~:$i > temp.sql
   echo MASTER_SQL_FILE
   cat temp.sql
   echo
   echo TEST_SQL_FILE
   cat $i
   echo
   mysql-schema-diff --password='runner123' temp.sql $i | grep -c "DROP"
   done
exit $ret