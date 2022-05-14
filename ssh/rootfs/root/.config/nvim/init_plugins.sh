#!/bin/sh
# can be used as git-hook: ln -s ../../init_plugins.sh .git/hooks/post-merge
if [ ! -f "autoload/plug.vim" ]; then
	[ -d "autoload" ] || mkdir autoload
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O autoload/plug.vim
fi

nvim -c 'PlugClean!' -c 'PlugUpdate' -c 'UpdateRemotePlugins' -c 'qall'

