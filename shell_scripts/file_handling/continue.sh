
cd /etc

for file in `ls`
do
  echo "file = $file"
  if [ $file = "passwd" ]; then
    while read line
    do
      user=`echo $line | cut -d : -f 1`
      echo "user=[$user]"
      if [ $user != "backup" ]; then
        echo "******user is [$user]******so continuing"
        continue
      fi  
      shell=`echo $line | cut -d : -f 7`
      echo "shell of user[$user] = [$shell]" 
    done < $file
    break 
  fi
done
