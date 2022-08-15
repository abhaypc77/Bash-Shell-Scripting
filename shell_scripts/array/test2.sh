#! /bin/bash

declare -A prof_prop_table
declare -A qa_prop_table

declare -i num_prof_prop=0
declare -i num_qa_prop=0

init ()
{
if [ -f final.properties ]; then
  rm final.properties
fi

if [ -f matched.properties ]; then
  rm matched.properties
fi

if [ -f unmatched.properties ]; then
  rm unmatched.properties
fi

if [ -f prof.properties ]; then
  rm prof.properties
fi

if [ -f qa.properties ]; then
  rm qa.properties
fi

}

############################################################

parse_prof_prop ()
{

local prof_prop_file=$1
echo "Parsing profiling property file : $prof_prop_file"
echo -n "Creating PROF-Table......."
while read line
do
  #echo "$line"

  if [[ -n "$line" && "$line" != [[:blank:]#]* ]]; then
    prop=`echo $line | cut -d '=' -f 1`
    prop_value=`echo $line | cut -d '=' -f 2`
 
    prof_prop[$num_prof_prop]=$prop
    prof_prop_table[$prop]=$prop_value
 
    num_prof_prop=$((num_prof_prop + 1))

  fi
done < $prof_prop_file

for prop in ${prof_prop[@]}
do
  echo "$prop = ${prof_prop_table[$prop]}" >> prof.properties
done

echo "DONE"
echo "Number of profiling properties = $num_prof_prop"

}

#################################################

parse_qa_prop ()
{
local qa_prop_file=$1

echo "Parsing QA property file : $qa_prop_file"
echo -n "Creating QA-Table......."

while read line
do
  #echo "$line"

  if [[ -n "$line" && "$line" != [[:blank:]#]* ]]; then
    prop=`echo $line | cut -d '=' -f 1`
    prop_value=`echo $line | cut -d '=' -f 2`
 
    qa_prop[$num_qa_prop]=$prop
    qa_prop_table[$prop]=$prop_value
 
    num_qa_prop=$((num_qa_prop + 1)) 
  fi
done < $qa_prop_file


for prop in ${qa_prop[@]}
do
  echo "$prop = ${qa_prop_table[$prop]}" >> qa.properties
done

echo "DONE"
echo "Number of QA properties = $num_qa_prop"

}

##################################################

compare_prof_qa_prop ()
{
if [ $num_prof_prop -ge $num_qa_prop ]; then
  for prop in ${prof_prop[@]}
  do
    if [ "${qa_prop_table[$prop]}" ]; then
      if [ "${prof_prop_table[$prop]}" = "${qa_prop_table[$prop]}" ]; then
        echo "$prop = ${prof_prop_table[$prop]}" >> final.properties
        echo "$prop = ${prof_prop_table[$prop]}" >> matched.properties
      elif [ "${qa_prop_table[$prop]}" = "true" -o "${qa_prop_table[$prop]}" = "false" ]; then
		echo "$prop = ${qa_prop_table[$prop]}" >> final.properties
        echo "$prop = ${qa_prop_table[$prop]}" >> unmatched.properties 
	  else 
        echo "$prop = ${prof_prop_table[$prop]}" >> final.properties
        echo "$prop = ${prof_prop_table[$prop]}" >> unmatched.properties
	  fi
    else  
      echo "$prop = ${prof_prop_table[$prop]}" >> final.properties
	  echo "$prop = ${prof_prop_table[$prop]}" >> unmatched.properties
    fi      
  done
  
else  

  for prop in ${qa_prop[@]}
  do
    if [ "${prof_prop_table[$prop]}" ]; then
      if [ "${qa_prop_table[$prop]}" = "${prof_prop_table[$prop]}" ]; then
        echo "$prop = ${qa_prop_table[$prop]}" >> final.properties
        echo "$prop = ${qa_prop_table[$prop]}" >> matched.properties
      elif [ "${qa_prop_table[$prop]}" = "true" -o "${qa_prop_table[$prop]}" = "false" ]; then
		echo "$prop = ${qa_prop_table[$prop]}" >> final.properties
        echo "$prop = ${qa_prop_table[$prop]}" >> unmatched.properties 
	  else 
        echo "$prop = ${prof_prop_table[$prop]}" >> final.properties
        echo "$prop = ${prof_prop_table[$prop]}" >> unmatched.properties
      fi
    else  
      echo "$prop = ${qa_prop_table[$prop]}" >> final.properties
	  echo "$prop = ${qa_prop_table[$prop]}" >> unmatched.properties
    fi      
  done
  
fi

}


############MAIN#################################

prof_property_file=$1
qa_property_file=$2

init
echo ""
parse_prof_prop $prof_property_file
echo ""
echo ""
parse_qa_prop $qa_property_file
echo ""
compare_prof_qa_prop






