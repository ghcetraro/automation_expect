#!/usr/bin/expect

set timeout 60

set USER [lindex $argv 0]
set PASS [lindex $argv 1]
set SERVER [lindex $argv 2]

# We escaped the `$` symbol with backslash to match literal '$' 
# The last '$' sign is to represent end-of-line

set prompt "#|%|>|\\\$ $"

#spawn ssh-copy-id pepe@pepeserver.comc
spawn ssh-copy-id $USER@$SERVER

expect {
        "(yes/no)?"  {send "yes\r";exp_continue}
        "password:" {send "$PASS\r";exp_continue}
        -re $prompt 
}


