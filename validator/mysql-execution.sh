#!/bin/sh
sudo apt-get install libmysql-diff-perl
for i in $1
   do
   echo "$i"
   echo master_branch
   touch temp.sql
   git show b56201157c488331d24cae81350a91869a06a24d:$i > temp.sql
   cat $temp.sql
   cat temp.sql
   echo test_branch
   cat $i
   mysql-schema-diff $i $i | grep -c "DROP"
   echo
   done
