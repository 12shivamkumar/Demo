#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
echo $1

echo $2

for i in $1
   do
   echo "$i"
   done

exit $ret