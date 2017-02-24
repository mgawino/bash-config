#!/usr/bin/env bash

set -e

source user/.utils

download() {
    cmd="$1"
    file="$2"
    msg="$3"
    info "Removing $2..."
    rm -fr $file
    info "Downloading $3"
    $cmd $file
}

git_version=`git --version | rev | cut -d " " -f 1`

if [[ "${git_version}" < "1.9.1" ]]
then
    error "Git version >= 1.9.1 required"
fi

cmd="curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o"
file="$HOME/.git-completion.bash"
msg="git completion"
download "$cmd" "$file" "$msg"

cmd="git clone https://github.com/magicmonty/bash-git-prompt.git"
file="$HOME/.bash-git-prompt"
msg="bash git prompt"
download "$cmd" "$file" "$msg"

info "Copying user config files..."
rsync -av --progress user/ ~

info "Copying programs config files..."
rsync -av --progress program_configs/ ~

info "Creating custom files (.custom_bashrc, .custom_profile)..."
touch ~/.custom_bashrc
touch ~/.custom_profile
info "Refreshing .profile..."
source ~/.profile

info "Installing dependencies..."
sudo apt-get install realpath vim ipython

info "Installing programs..."
sudo apt-get install xpad  # sticky notes on desktop
