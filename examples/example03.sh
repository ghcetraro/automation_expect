#!/usr/bin/expect
set timeout 60
spawn ssh user@server1
expect "assword" { send "password\r"; }
# We escaped the `$` symbol with backslash to match literal '$' 
# The last '$' sign is to represent end-of-line
set prompt "#|%|>|\\\$ $"
expect {
        "(yes/no)"  {send "yes\r";exp_continue}
        "password:" {send "password\r";exp_continue}
        -re $prompt 
}
send "./jboss.sh status\r"
expect {
        "running" {send "echo running\r"}
        -re $prompt {send "./jboss.sh start \r"}
}
expect -re $prompt
