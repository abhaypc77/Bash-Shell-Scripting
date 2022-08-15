
arr=( 1 2 3 4 5 )

a[0]=1
a[1]=2
a[2]=3
a[3]="Hiiii"
a[4]="Hello"

echo "First Elements is: ${a[0]}"
echo "Second Element is: ${a[1]}"
echo "Fifth Element is: ${a[4]}"
echo ""

echo "Elements of array are: ${a[*]}"
echo "Elements of array are: ${a[@]}"
echo ""

echo "Length of First Element is: ${#a[1]}"
echo "Length of Fourth Element is: ${#a[3]}"
echo ""

echo "Number of Elements is: ${#a[*]}"
echo "Number of Elements is: ${#a[@]}"
echo ""

for i in "${a[*]}"
do
echo "Value of i is $i"
done

echo ""

for i in "${a[@]}"
do
echo "Value of i is $i"
done
