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
   git show $value~:$i > temp.sql
   touch temp1.sql
   mysql-schema-diff --user=root --password=root temp.sql $i > temp1.sql
   val="$(grep -c "DROP" temp1.sql)"

   if [[ $val>0 ]]
   then
     key=$(echo $i | cut -d'/' -f 2-)
     changed_files["${key}"]=$i
   fi
done

if [[ ${#changed_files[@]} -gt 0  ]]; then
  ret=1
fi
if [[ ret==1 ]]; then
  echo "These were the sql files where u have DROP some column from Schema"
  echo ${changed_files[@]}
fi

exit $ret