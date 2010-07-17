#!/bin/bash
#
# Switch network profile using a list displayed with dmenu.
#
# Author:   Tom Vincent
# Created:  2009-07-04

# Imports:
. "$HOME/proj/src/bash/lib/rootCheck.sh"

rootCheck

CMD="$(ls /etc/network.d/ -1Ap | grep -v \/ | dmenu)"
if [[ -n "$CMD" ]]; then
    netcfg -a
    netcfg $CMD
fi
