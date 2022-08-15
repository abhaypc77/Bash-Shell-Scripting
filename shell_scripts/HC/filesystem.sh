
DISK_THRESHOLD=30

check_disk ()
{
df -h > temp.$$
sed -i '1d' temp.$$

while read line 
do
  use=`echo $line | awk '{print $5}' | sed 's/%//'`
  if [ $use -gt $DISK_THRESHOLD ]; then
    DISK_UTILIZATION+="$line------"
    echo $DISK_UTILIZATION
  fi
done < temp.$$

rm temp.$$

if [ "$DISK_UTILIZATION" != "" ]
then
echo "Disk_Utilzation : $DISK_UTILIZATION#" ;
else
echo "Disk_Utilzation : OK#" ;
fi
}

check_disk
