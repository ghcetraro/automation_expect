#!/usr/bin/expect -f
set timeout 20
set IPaddress "192.168.0.1"
set Username "zaib"
set Password "zaib"
set PORT "$1"
spawn ssh -o "StrictHostKeyChecking no" $Username@$IPaddress
expect "*assword: "
send "$Password\r"
expect ">"
send "enable\r"
expect "*assword: "
send "$Password\r"
send "conf term\r"
send "interface gigabitEthernet 1/0/$PORT\r"
expect "#"
send "shut\r"
expect "#"
send "exit\r"
expect "#"
send "exit\r"
send "wr\r"
send "exit\r"
exit
