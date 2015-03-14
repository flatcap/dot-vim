#!/bin/bash

PATH="/usr/bin:/usr/sbin"

set -o errexit	# set -e
set -o nounset	# set -u

renice --priority 19 --pid $$ > /dev/null
ionice --class 3     --pid $$ > /dev/null

umask 0077

BASE=${0%/*}

cd "$BASE"

find backup/ swap/ undo/ view/ -type f -delete

rm -f viminfo

