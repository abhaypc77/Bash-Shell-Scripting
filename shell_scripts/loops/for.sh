for ((i=0; i<10; i++))
do
  echo $i
  if [ $i -eq 5 ];
  then 
    break
  fi 
done
