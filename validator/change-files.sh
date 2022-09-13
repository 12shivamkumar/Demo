#!/bin/sh
echo $1

declare -a files_list
files_list=$1

echo ${files_list}

declare -A schema_list

echo ${schema_list}

for i in ${files_list[*]}
do
if [[ "$i" =~ ^schema.* ]]; then
  key=$(echo $i | cut -d'/' -f 1-)
  schema_list["${key}"]=$i
fi
done

echo here

change_in_db_files=false

echo $change_in_db_files

if [[ ${#schema_list[@]} -gt 0 ]]; then
  change_in_db_files=true
fi

echo $change_in_db_files
echo ${schema_list}

echo "::set-output name=schema_files::" "${schema_list[@]}"
echo "::set-output name=db_file_change_exists::$change_in_db_files"