#!/usr/bin/expect --
#Notify you when mkdvd needs another DVD inserted and when completed.  
#Specify mkdvd command line as argument to this script.
#For example, ./mkdvdnotify mkdvd -d /dev/cd0 -m /mksysb .....
set timeout -1
puts "Running command:  $argv"
eval spawn $argv

while true {
    expect {
        "The backup will require an additional CD or DVD" {
            exec ##Put command line here to email you/page you that we need another DVD
            puts "Need to insert additional CD/DVD"
            interact "\r" return
            send "\r"
        }
        eof {
            exec ##Put command line here to email you/page you that mksysb is done
            puts "mksysb command completed"
            break
        }
    }
} 
