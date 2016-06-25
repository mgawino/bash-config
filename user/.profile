# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.utils" ]; then
        source "$HOME/.utils"
    fi
    if [ -f "$HOME/.bashrc" ]; then
	    source "$HOME/.bashrc"
    fi
fi

if [ -f ~/.custom_profile ]; then
    source ~/.custom_profile
fi

export EDITOR=vim
