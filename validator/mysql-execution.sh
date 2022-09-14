#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl

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
   mysql-schema-diff temp.sql $i || ret 1
   done
exit $ret