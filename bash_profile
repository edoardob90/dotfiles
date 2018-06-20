#! /bin/bash
# File sourced by Bash on login
# set zsh instead of bash as default shell
#if case "$-" in *i*) true;; *) false;; esac &&
#    [ -z "$ZSH_VERSION" ] &&
#    type zsh >/dev/null 2>/dev/null; then
#        export SHELL=$(which zsh); exec $(which zsh)
#fi

# Inherit all the settings and customizations present in .bashrc
#source ${HOME}/.bashrc

# if exists, source .bash_login
if [ -f ${HOME}/.bash_login ]; then
    source ${HOME}/.bash_login
fi

export SHELL=$(which zsh)
#[ -z "$ZSH_VERSION" ] && exec "$SHELL -l"
