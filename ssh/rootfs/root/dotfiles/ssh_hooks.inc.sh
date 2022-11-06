#!/bin/bash

keyring_socket="/run/user/$(id -u)/keyring/ssh"

if [ -r "$keyring_socket" ]; then
    export SSH_AUTH_SOCK="$keyring_socket"

else
    # make sure ssh-agent is running exactly once
    infoFile="/tmp/ssh-agent-vars.sh"

    if [ -f "$infoFile" ]; then
        source "$infoFile" >/dev/null
    fi


    # socket but no pid found -> try to determine pid
    if [ -n "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ]; then
        export SSH_AGENT_PID="$(pgrep ssh-agent)" || export SSH_AGENT_PID=
        if [ -n "$SSH_AGENT_PID" ]; then
            echo "export SSH_AGENT_PID=$SSH_AGENT_PID" > "$infoFile"
            echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> "$infoFile"
        fi
    fi

    # no or invalid pid -> start agent
    if [ -z "$SSH_AGENT_PID" ] || ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
        ssh-agent > "$infoFile"
        source "$infoFile" >/dev/null
    fi
fi

# hook ssh-add command
ssh_add_bin="$(which ssh-add)"
function ssh-add {
	if [ -z "$1" ]; then
		"$ssh_add_bin" -l || "$ssh_add_bin"
	else
		"$ssh_add_bin" "$@"
	fi
}


# hook ssh command
ssh_bin="$(which ssh)"
function ssh {
	ssh-add
	"$ssh_bin" "$@"
}

