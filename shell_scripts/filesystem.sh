
df -h > temp.$$
filesys=""

sed -i '1d' temp.$$ 
 
while read line 
do
  #echo $line
  use=`echo $line | awk '{print $5}' | sed 's/%//'`
  #echo $use
  
  if [ $use -gt 30 ]; then
    filesys+="$line....." 
    #echo $line
  fi
done < temp.$$ 

rm temp.$$
echo $filesys
