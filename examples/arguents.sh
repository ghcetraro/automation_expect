#!/usr/bin/expect -f

set arg1 [lindex $argv 0]

spawn lockdis -p
expect "password:" {send "$arg1\r"}
expect "password:" {send "$arg1\r"}
expect "$ "
