#! /bin/bash
# File sourced by Bash on login

# inherit all the settings and customizations present in .bashrc
export FROM_LOGIN="yes"
source ${HOME}/.bashrc

# if exists, source .bash_login
if [ -f ${HOME}/.bash_login ]; then
    source ${HOME}/.bash_login
fi
