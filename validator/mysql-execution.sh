#!/bin/sh
sudo apt-get install libmysql-diff-perl
for i in $1
   do
   touch temp.sql
   git show b56201157c488331d24cae81350a91869a06a24d:$i > temp.sql
   cat temp.sql
   echo
   done
