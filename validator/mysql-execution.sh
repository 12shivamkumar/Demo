#!/bin/sh
sudo apt-get install libmysql-diff-perl
for i in $1
   do
   echo "$i"
   echo master_branch
   git show b56201157c488331d24cae81350a91869a06a24d:$i
   echo test_branch
   cat $i
   mysql-schema-diff  | git show b56201157c488331d24cae81350a91869a06a24d:$i $i | grep -c "DROP"
   echo
   done
