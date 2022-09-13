#!/bin/sh

declare -a files_list
files_list=$1

echo ${files_list}

declare -A schema_list
declare -A seed_data_list
for i in ${files_list[*]}
do
if [[ "$i" =~ ^schema.* ]]; then
  key=$(echo $i | cut -d'/' -f 2-)
  echo schema $key
  schema_list["${key}"]=$i
elif [[ "$i" =~ ^seed_data.*  ]]; then
  key=$(echo $i | cut -d'/' -f 2-)
  echo seed $key
  seed_data_list["${key}"]=$i
  if [[ ! -v schema_list["${key}"] ]]; then
    schema_list["${key}"]="schema/""$key"
  fi
fi
done

echo ${schema_list}
echo $change_in_db_files

change_in_db_files=false
if [[ ${#schema_list[@]} -gt 0 || ${#seed_data_list[@]} -gt 0 ]]; then
  change_in_db_files=true
fi

echo ${schema_list}
echo $change_in_db_files

echo "::set-output name=schema_files::" "${schema_list[@]}"
echo "::set-output name=seed_data_files::" "${seed_data_list[@]}"
echo "::set-output name=db_file_change_exists::$change_in_db_files"

echo ${schema_files}