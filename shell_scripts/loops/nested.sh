table_limit=10

for ((table_no=1; table_no <= 5; table_no++))
do
  echo "******Table of $table_no*********"
  for (( i=1; i<=table_limit; i++))
  do
    mul=`expr $table_no \* $i`
    echo "$table_no * $i = $mul"
  done
done
