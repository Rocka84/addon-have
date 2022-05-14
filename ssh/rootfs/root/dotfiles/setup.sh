#/bin/bash

dir_home="${1:-$HOME}"
dir_self="$(realpath $(dirname $0))"

backup_date="$(date +%s)"

function createLink() {
    source="$1"
    target="$2"

    sudo_cmd=
    [ "$3" == "1" ] && sudo_cmd="sudo"

    [ ! -f "$source" ] && return 1

    if [ "$(realpath "$target" 2>/dev/null)" == "$source" ]; then
        # echo "$target already is a link to $source"
        return 0
    fi

    if [ -f "$target" ] && [ -z "$no_back" ]; then
        $sudo_cmd mv "$target" "${target}.bak.$backup_date"
    fi

    $sudo_cmd ln -s "$source" "$target"
    return 0
}

function simpleLink() {
    file="$1"

    # echo "simple link for $file"
    createLink "$dir_self/$file" "$dir_home/.$file" "$2"
}

simpleLink "bashrc"
simpleLink "ssh_hooks.inc.sh"
simpleLink "tmuxline.tmux"
simpleLink "powerprompt.sh"

# ranger
mkdir -p "$HOME/.config/ranger/plugins"
createLink "$dir_self/ranger.rc.conf" "$HOME/.config/ranger/rc.conf"
if [ ! -d "$HOME/.config/ranger/plugins/devicons2" ]; then
    git clone https://github.com/cdump/ranger-devicons2 "$HOME/.config/ranger/plugins/devicons2"
fi

dir_byobu="$BYOBU_CONFIG_DIR"
[ -z "$dir_byobu" ] && dir_byobu="$dir_home/.byobu"
[ -d "$dir_byobu" ] || dir_byobu="$dir_home/.config/byobu"

# echo "link tmux.conf to $dir_byobu/.tmux.conf"
createLink "$dir_self/tmux.conf" "$dir_byobu/.tmux.conf"

createLink "$dir_self/gitconfig" "/etc/gitconfig" "1"
