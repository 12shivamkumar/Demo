#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
sudo /etc/init.d/mysql start

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
   mysql-schema-diff --user=root --password=root temp.sql $i | grep -c "DROP" > drop_count

   echo $drop_count

   echo
   if [ drop_count ]
   then
     echo MASTER_SQL_FILE
   else
     echo TEST_SQL_FILE
   fi
   done
exit $ret