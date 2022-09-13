#!/bin/sh
ret=0

echo $1

echo $2

for i in $1
   do
   echo "$i"
   mysql-schema-diff $i $i
   done

exit $ret