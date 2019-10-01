#!/usr/bin/expect

set timeout 60

# We escaped the `$` symbol with backslash to match literal '$' 
# The last '$' sign is to represent end-of-line

set prompt "#|%|>|\\\$ $"

spawn ssh-copy-id pepe@pepeserver.comc

expect {
        "(yes/no)?"  {send "yes\r";exp_continue}
        "password:" {send "password\r";exp_continue}
        -re $prompt 
}


