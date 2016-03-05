#! /bin/bash

zypper se -i --type package | grep "i |" | cut -d"|" -f2 | cut -d" " -f2 | sort > /tmp/_zypp_packages

cat /var/lib/zypp/AutoInstalled | sort > /tmp/_zypp_auto

cp /etc/zypp/.systemCheck /etc/zypp/systemCheck

echo  >> /etc/zypp/systemCheck
echo "## User packages ##" >> /etc/zypp/systemCheck
for x in $(comm -23 /tmp/_zypp_packages /tmp/_zypp_auto); do echo requires:$x >> /etc/zypp/systemCheck ; done
echo "## ############# ##" >> /etc/zypp/systemCheck

rm /tmp/_zypp_packages /tmp/_zypp_auto
