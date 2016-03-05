#! /bin/bash

zypper se -i --type package | grep "i |" | cut -d"|" -f2 | cut -d" " -f2 | sort  > /tmp/autoinstalled

sort /etc/zypp/systemCheck | grep requires | cut -d":" -f2 > /tmp/world

comm -23 /tmp/autoinstalled /tmp/world  > /var/lib/zypp/AutoInstalled

rm /tmp/autoinstalled /tmp/world
