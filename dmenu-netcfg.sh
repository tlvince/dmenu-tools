#!/bin/bash
#
# Switch network profile using a list displayed with dmenu.
#
# Author:   Tom Vincent
# Created:  2009-07-04

if [[ $EUID -ne 0 ]]; then
    echo "${0##*/} must be run as root" 1>&2
    exit 1
fi

CMD="$(ls /etc/network.d/ -1Ap | grep -v \/ | dmenu)"
if [[ -n "$CMD" ]]; then
    netcfg -a
    netcfg $CMD
fi
