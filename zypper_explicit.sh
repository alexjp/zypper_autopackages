#! /bin/bash

zypper se -i --type package | grep "i |" | cut -d"|" -f2 | cut -d" " -f2 | sort > /tmp/_zypp_packages

cat /var/lib/zypp/AutoInstalled | sort > /tmp/_zypp_auto

comm -23 /tmp/_zypp_packages /tmp/_zypp_auto > /etc/zypp/systemCheck.d/world

rm /tmp/_zypp_packages /tmp/_zypp_auto
