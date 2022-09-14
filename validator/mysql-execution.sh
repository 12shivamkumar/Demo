#!/bin/sh
ret=0
for i in $1
   do
   echo "$i"
   cat $i
   done

exit $ret
