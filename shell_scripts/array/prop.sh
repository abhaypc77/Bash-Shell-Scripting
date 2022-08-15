#! /bin/bash

declare -A prop_name_tbl
declare -A prop_value_tbl

declare -i num_prop=0

prop_init ()
{
if [ -f prop_names ]; then
  rm prop_names
fi

if [ -f prop_values ]; then
  rm prop_values
fi

}


parse_prop_file ()
{

local prop_file=$1
echo "Parsing property file : $prop_file"
echo -n "Creating Table......."
while read line
do
  #echo "$line"

  if [[ -n "$line" && "$line" != [[:blank:]#]* ]]; then
    prop_name=`echo $line | cut -d '=' -f 1`
    prop_value=`echo $line | cut -d '=' -f 2`
 
    prop_name_tbl[$num_prop]=$prop_name
    prop_value_tbl[$num_prop]=$prop_value
 
    num_prop=$((num_prop + 1))

  fi
done < $prop_file


for prop_name in ${prop_name_tbl[@]}
do
  echo "Prop Name = $prop_name" >> prop_names
done

for prop_value in ${prop_value_tbl[@]}
do
  echo "Prop Value = $prop_value" >> prop_values
done


echo "DONE"
echo "Number of properties = $num_prop"

}


############MAIN#################################

property_file=$1

echo ""
prop_init
parse_prop_file $property_file
echo ""






