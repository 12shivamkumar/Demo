#!/bin/sh
ret=0
for i in $1
   do
   echo "$i"
   git show master:$i
   cat $i
   done

exit $ret
