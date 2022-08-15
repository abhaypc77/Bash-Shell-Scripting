for x in 1 2 3
do
  for y in 1 2 3
  do
    for z in 1 2 3
    do
      if [ $x -ne $y -a $x -ne $z -a $y -ne $z ]
      then
        echo "$x $y $z"
      fi
    done
  done
done
