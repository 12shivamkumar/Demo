#!/bin/sh
sudo apt-get install libmysql-diff-perl
for i in $1
   do
   touch temp.sql
   git show b56201157c488331d24cae81350a91869a06a24d:$i > temp.sql
   echo MASTER_SQL_FILE
   cat temp.sql
   echo
   echo TEST_SQL_FILE
   cat $i
   done
