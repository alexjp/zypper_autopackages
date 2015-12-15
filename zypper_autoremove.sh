#! /bin/bash

zypper rm -u $(zypper pa --unneeded | grep "i |" | cut -d"|" -f3)
