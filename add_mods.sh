#!/bin/bash

cd "$(dirname "$0")"

mkdir -p ssh/rootfs/root/.config/

rm -rf ssh/rootfs/root/.config/nvim
if [ ! -d "ssh/rootfs/root/.config/nvim" ]; then
    pushd ssh/rootfs/root/.config/ >/dev/null
    git clone --branch master --depth=1 git@bitbucket.org:Rocka84/neovim-config.git nvim
    popd >/dev/null
fi

rm -rf ssh/rootfs/root/dotfiles
if [ ! -d "ssh/rootfs/root/dotfiles" ]; then
    pushd ssh/rootfs/root/ >/dev/null
    git clone --branch master --depth=1 git@bitbucket.org:Rocka84/dotfiles.git
    popd >/dev/null
fi

cp ~/.powerprompt.sh ssh/rootfs/root/

rm -f ssh/rootfs/etc/profile.d/bashrc.sh
mkdir -p ssh/rootfs/etc/profile.d/
ln -s /root/.bashrc ssh/rootfs/etc/profile.d/bashrc.sh

