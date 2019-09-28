#!/usr/bin/expect
#set timeout 10
spawn zypper refresh
expect -exact "Do you want to reject the key, trust temporarily, or trust always?\r"
send -- "t\r"
expect eof
