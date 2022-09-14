#!/bin/sh
ret=0
for i in $1
   do
   echo "$i"
   git diff master:$i test:$i
   cat $i
   done

exit $ret
