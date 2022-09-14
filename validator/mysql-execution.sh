#!/bin/sh
ret=0
for i in $1
   do
   echo "$i"
   echo master
   git show master:$1
   echo test
   cat $i
   done

exit $ret
