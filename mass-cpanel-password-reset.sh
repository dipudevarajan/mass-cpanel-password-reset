#! /bin/bash

awk '{print $2}' /etc/trueuserdomains | while read user; do
# random string of 16 character is generated
pass=`</dev/urandom tr -dc "A-Za-z0-9*-/+.*=_\|\\#" | head -c16`
# cpanel username and new passwords written to new-passwords.txt
echo "$user $pass" >> new-passwords.txt
whmapi1 passwd user=$user password=$pass
done
