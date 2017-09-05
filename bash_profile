#! /bin/bash
# File sourced by Bash on login
# set zsh instead of bash as default shell
preferred_shell=
if [ -x $(which zsh) ]; then
    preferred_shell=$(which zsh)
fi
if [ -n "$preferred_shell" ]; then
  case $- in
    *i*) SHELL=$preferred_shell; export SHELL; exec "$preferred_shell";;
  esac
fi

# inherit all the settings and customizations present in .bashrc
#export FROM_LOGIN="yes"
#source ${HOME}/.bashrc

# if exists, source .bash_login
if [ -f ${HOME}/.bash_login ]; then
    source ${HOME}/.bash_login
fi
