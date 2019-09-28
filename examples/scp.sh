#!/usr/bin/expect -f 
 set filename [lindex $argv 0] 
 set timeout -1 
 spawn scp $filename user@host:/home/user/ 
 set pass "password" 
 
 expect { 
      password: {send "$pass\r" ; exp_continue} 
      eof exit 
 }
