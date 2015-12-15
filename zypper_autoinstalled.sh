#! /bin/bash

zypper se -i --type package | grep "i |" | cut -d"|" -f2 | cut -d" " -f2 | sort  > /tmp/autoinstalled

sort /var/lib/zypp/world -o /var/lib/zypp/world

comm -23 /tmp/autoinstalled /var/lib/zypp/world  > /var/lib/zypp/AutoInstalled

rm /tmp/autoinstalled

cat /var/lib/zypp/AutoInstalled
