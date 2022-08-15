#/bin/bash


func1()
{
  echo "Inside function 1 of $0"
  echo "No of arguments = $#"
  echo "First arg = $1"
  echo "Second arg = $2"
  echo "All arg = $*"
  echo "All arg = $@"
  return 1
}


func2()
{
  echo "Inside function 2 of $0"
  echo "No of arguments = $#"
  echo "First arg = $1"
  echo "Second arg = $2"
  echo "All arg = $*"
  echo "All arg = $@"
  return 2
}

###################################
echo "Inside Main function of $0"
echo "All arguments = $#"
echo "First arg = $1"
echo "Second arg = $2"
echo "All arg = $*"
echo "All arg = $@"
echo ""

func1 1 2 
ret=$?
echo $ret
echo ""

func2 a b c
ret=$?
echo $ret
echo ""


exit 0

