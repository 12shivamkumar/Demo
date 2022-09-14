#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
echo

sudo systemctl status mysql
echo

sudo /etc/init.d/mysql start
echo

sudo systemctl status mysql
echo

mysql -e 'SELECT @@datadir;' -uroot -proot

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
   mysql-schema-diff temp.sql $i | grep -c "DROP"
   done
exit $ret