#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
echo
sudo systemctl start mysql
echo
sudo systemctl status mysql
echo

sudo mysql -uroot -pShivam@123
mysql -e 'CREATE USER 'runner'@'localhost' IDENTIFIED BY 'runner123';' -uroot -pShivam@123
mysql -e 'GRANT ALL PRIVILEGES ON *.* TO 'runner'@'localhost' WITH GRANT OPTION;' -uroot -pShivam@123
mysql -e 'FLUSH PRIVILEGES;' -uroot -pShivam@123

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
   mysql-schema-diff  --user=runner, --password=runner123 temp.sql $i | grep -c "DROP"
   done
exit $ret