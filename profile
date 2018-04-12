#!/bin/bash
# set shell: zsh instead of bash
#if case "$-" in *i*) true;; *) false;; esac &&
#    [ -z "$ZSH_VERSION" ] &&
#    type zsh >/dev/null 2>/dev/null; then
#        export SHELL=$(which zsh)
#        exec $(which zsh)
#fi

export SHELL=$(which zsh)
#[ -z "$ZSH_VERSION" ] && exec "$SHELL -l"
