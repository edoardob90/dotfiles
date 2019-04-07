#!/bin/bash
# Source bash_profile and bashrc
for file in bashrc bash_profile; do
    if [[ -f "${HOME}/.${file}" ]]; then
        . "${HOME}/.${file}"
    fi
done

# set shell: zsh instead of bash
#if case "$-" in *i*) true;; *) false;; esac &&
#    [ -z "$ZSH_VERSION" ] &&
#    type zsh >/dev/null 2>/dev/null; then
#        export SHELL=$(which zsh)
#        exec $(which zsh)
#fi

# Set default shell (dirty trick) --> done via LDAP-wide configuration
#export SHELL=$(which zsh)

# Workaround for some GTK apps that don't read keyboard preferences correcly (namely accented letters)
export QT_IM_MODULE="xim"

