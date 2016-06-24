#!/usr/bin/env bash

set -e

error() {
    red=`tput setaf 1`
    reset=`tput sgr0`
    echo "${red}$1${reset}"
    exit 1
}

info() {
    green=`tput setaf 2`
    reset=`tput sgr0`
    echo "${green}$1${reset}"
}

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
rsync -av --progress programs/ ~

info "Creating custom files (.custom_bashrc, .custom_profile)..."
touch ~/.custom_bashrc
touch ~/.custom_profile
