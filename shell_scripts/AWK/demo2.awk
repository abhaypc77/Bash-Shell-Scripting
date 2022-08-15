BEGIN {
  print "***************************"
  print "Bill for the purchase      "
  print "***************************"
}

{
total = $3 * $4
recno = $1
item = $2
gtotal += total
print recno " " item " Rs." total
}

END {
  print "***************************"
  print "Total Rs." gtotal
  print "***************************"
}

