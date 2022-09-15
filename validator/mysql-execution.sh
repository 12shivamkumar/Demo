#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
sudo /etc/init.d/mysql start

declare -a value
value=$2

echo $value

declare -a changed_files

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
   mysql-schema-diff --user=root --password=root temp.sql $i | grep -c "DROP"
   drop_count=1
   if [ drop_count ]
   then
     changed_files=($i)
   fi
   done

   echo ${changed_files[*]}
exit $ret