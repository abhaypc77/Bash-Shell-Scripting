#!/usr/bin/expect -f
spawn ssh 127.0.0.1
expect "password:"
send "123456\r"
interact
