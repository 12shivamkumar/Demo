#!/bin/sh
ret=0
sudo sudo apt-get install libmysql-diff-perl
echo $1

echo $2

for i in $1
   do
   echo "$i"
   mysql-schema-diff schema/validate/one.sql $1
   done

exit $ret