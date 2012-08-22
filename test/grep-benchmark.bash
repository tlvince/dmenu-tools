#!/bin/bash
# Grep benchmarks.
# Copyright 2012 Tom Vincent <http://tlvince.com/contact/>

CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/dmenu-tools/dmenu-cache.txt"

echo "Piped grep"
time for i in {1..1000}; do
  grep -F "dmenu-" "$CACHE" | grep -Fv -e "path" -e "-menu" >/dev/null
done

echo -e "\nPiped egrep"
time for i in {1..1000}; do
  grep -F "dmenu-" "$CACHE" | egrep -v "path|-menu" >/dev/null
done

echo -e "\nPiped egrep, non fixed string"
time for i in {1..1000}; do
  grep "dmenu-" "$CACHE" | egrep -v "path|-menu" >/dev/null
done
