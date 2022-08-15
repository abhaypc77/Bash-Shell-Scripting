cat << End-of-message
-------------------------------------
This is line 1 of the message.
This is line 2 of the message.
This is line 3 of the message.
This is line 4 of the message.
This is the last line of the message.
-------------------------------------
End-of-message



tr a-z A-Z <<- END_TEXT
      one two three
      four five six
END_TEXT


The cat <<EOF Bash syntax is very useful when one needs to work with multiline strings in Bash, eg. when passing multiline string to a variable, file or a piped command.

Examples of Bash cat <<EOF syntax usage:

1. Passing multiline string to a variable:

$ sql=$(cat <<EOF
SELECT foo, bar FROM db
WHERE foo='baz'
EOF
)
The $sql variable now holds newlines as well, you can check it with echo -e "$sql" cmd.

2. Passing multiline string to a file:

$ cat <<EOF > print.sh
#!/bin/bash
echo \$PWD
echo $PWD
EOF
The print.sh file now contains:

#!/bin/bash
echo $PWD
echo /home/user
3. Passing multiline string to a command/pipe:

$ cat <<EOF | grep 'b' | tee b.txt | grep 'r'
foo
bar
baz
EOF
This creates b.txt file with both bar and baz lines but prints only the bar.
