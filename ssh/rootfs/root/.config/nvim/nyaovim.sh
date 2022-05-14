#!/bin/bash

export DISPLAY=:0

# /usr/local/bin/nyaovim $@
# exit $?

if [ -n "$1" ]; then
	first="${1/ide\:\/\//}"
	first="${first/:/}"
	shift
else
    first=""
fi

/usr/local/bin/nyaovim $first $@ 2>/dev/null &

exit 0
