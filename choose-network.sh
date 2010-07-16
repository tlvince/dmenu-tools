#!/bin/sh
# Name:     choose-network.sh
# Author:   Tom Vincent
# Version:  2010-01-02
# Created:  2009-07-04
#
# Switch network profile using a list displayed with dmenu.
#
# If a profile is currently active, it will be disabled.
# Adapted from: http://bbs.archlinux.org/viewtopic.php?pid=516150#p516150

if [ $(whoami) != "root" ]; then
    echo "Sorry, you need to be root."
    exit 1
fi

CMD="$(ls /etc/network.d/ -1Ap | grep -v \/ | dmenu)"
if [ -n "$CMD" ]; then
    netcfg -a
    netcfg $CMD
fi
