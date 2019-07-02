# ~/.profile
# Contains user specific configurations for the Bourne shell and Bourne compatible shells

# set shell: zsh instead of bash
if case "$-" in *i*) true;; *) false;; esac; then
    if [ -z "$ZSH_VERSION" ] && type zsh >/dev/null 2>/dev/null; then
        export SHELL=$(which zsh)
    else
        export SHELL=$(which bash)
    fi
    exec $SHELL
fi
