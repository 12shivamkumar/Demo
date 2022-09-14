#!/bin/sh
for i in $1
   do
   echo "$i"
   echo master_branch
   git show ${github.event.pull_request.base.sha}:$i
   echo test_branch
   cat $i
   echo
   done
