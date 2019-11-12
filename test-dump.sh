#!/bin/bash

my_host="$(hostname -s)"
my_date="$(date -I)"
my_vol="${1}"
my_dump_lvl="0"
my_dumpfile="${my_date}-${my_vol}.xfsdump"

touch "/dump/${dumpfile}"
xfsdump -F -l "${my_dump_lvl}" -f "/dump/${dumpfile}" "${my_vol}"
