

file="/etc/passwd"
while read line
do
echo $line
done < $file
