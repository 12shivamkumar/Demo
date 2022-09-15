#!/bin/sh
ret=0
sudo apt-get install libmysql-diff-perl
sudo /etc/init.d/mysql start

declare -a value
value=$2

echo $value

declare -A changed_files

for i in $1
do
   touch temp.sql
   echo $value~
   git show $value~:$i > temp.sql
   echo MASTER_SQL_FILE
   cat temp.sql
   echo
   echo TEST_SQL_FILE
   cat $i
   touch temp1.sql
   mysql-schema-diff --user=root --password=root temp.sql $i > temp1.sql

   val="$(grep -c "DROP" temp1.sql)"

   if [[ $val>0 ]]
   then
     echo "result :"
     echo $val
     key=$(echo $i | cut -d'/' -f 2-)
     changed_files["${key}"]=$i
   fi
done

echo ${changed_files[@]}
exit $ret