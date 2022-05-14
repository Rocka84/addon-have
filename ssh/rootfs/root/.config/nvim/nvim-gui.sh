#!/bin/bash

export DISPLAY=:0

id="default"
title="nvimide"

if [ "$1" == "-i" ]; then
	id="$2"
    # [ "$id" != "default" ] && title="$id - $title"
    title="$id - $title"
	shift 2
elif [ "$1" == "-a" ]; then
    git_base="$(git rev-parse --show-toplevel 2>/dev/null)"
    if [ -n "$git_base" ]; then
        id="$(echo "$git_base" | md5sum | cut -c -32)"
        title="$git_base - $title"
    fi
    shift
fi

nvr="nvr"
socket="/tmp/nvimide-$id.socket"
pid_file="/tmp/nvimide-$id.pid"


pid="$(cat "$pid_file" 2>/dev/null)"
kill -0 "$pid" 2>/dev/null || pid=""

if [ -z "$pid" ]; then
	rm -f "$socket"
	NVIM_LISTEN_ADDRESS="$socket" mate-terminal --disable-factory -t "$title" -x nvim &
	pid="$!"
	sleep 2
fi

if [ -n "$1" ]; then
	first="${1/ide\:\/\//}"
	first="${first/:$/}"
	shift
	# $nvr --servername "$socket" --remote-silent "$first" $@ 2>/dev/null &
	# first="$(realpath $first)"
	"$nvr" --servername "$socket" --remote-send "<esc>:drop $first<cr>" "$@" 2>/dev/null &
	# [ -z "$pid" ] && pid="$!"
fi

if [ -n "$pid" ]; then
	# wmctrl -ia "$(wmctrl -lp | grep "$pid" | sed '1!d;s/^.*$(hostname) \(.\+\)$/\1/')"
	echo "$pid" > "$pid_file"
fi

wmctrl -a "$title"
wmctrl -r :ACTIVE: -b add,maximized_vert
wmctrl -r :ACTIVE: -b add,maximized_horz


if pgrep tilda >/dev/null; then
	(
		killall tilda
		while pgrep tilda>/dev/null; do sleep 0.1; done
		tilda >/dev/null
	) &
fi
exit 0
