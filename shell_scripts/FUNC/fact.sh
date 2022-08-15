
if [ -z "$1" ]
then
  echo "Usage: `basename $0` number"
  exit 1
fi

fact ()
{
  number=$1
  #  Variable "number" must be declared as local,
  #+ otherwise this doesn't work.
  if [ "$number" -eq 0 ]
  then
    factorial=1    # Factorial of 0 = 1.
  else
    let "decrnum = number - 1"
    fact $decrnum  # Recursive function call (the function calls itself).
    let "factorial = $number * $?"
  fi

  echo "Factorial of $factorial"
  return $factorial
}

fact $1
echo "Factorial of $1 is $?."

exit 0
