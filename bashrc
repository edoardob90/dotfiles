#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set correctly terminal colors
export TERM="xterm-256color"

# Define folder where actual files reside
BASHCONFDIR="${HOME}/.dotfiles"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s histverify

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lrt='ls -lrts'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f "$BASHCONFDIR/bash_aliases" ]; then
    source $BASHCONFDIR/bash_aliases
fi

# Custom functions
if [ -f "$BASHCONFDIR/functions" ]; then
    source $BASHCONFDIR/functions
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi



#if [[ `domainname -f` != "COSMOPC12" ]]; then
#    #export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$'
    #export PS1="[\[\033[32m\]\w\[\033[0m\]]\[\033[0m\]\n\[\033[1;31m\]\u\[\033[1;33m\]-> \[\033[0m\]"
#    export PS1="\n\[\e[1;30m\][$$:$PPID - \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY:-o} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n\$ "
#else
#    export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#fi

# Addition for TeX Live
sutlmgr () {
   if [[ -z "$@" ]]
   then
      sudo /opt/texbin/tlmgr -gui
   else
      sudo /opt/texbin/tlmgr "$@"
   fi
}
# Alias for TeX Live
#alias mktexlsr='sudo /opt/texbin/mktexlsr'
#alias updmap-sys='sudo /opt/texbin/updmap-sys'
#alias fmtutil-sys='sudo /opt/texbin/fmtutil-sys'

# $HOME/bin directory in the PATH
export PATH=${PATH}:${HOME}/bin

### !!! DEPRECATED !!!
### "module" environment is in use!
# Plumed path(s)
export PLUMED_VIMPATH=/home/ebaldi/apps/plumed2/lib/plumed/vim
#source /local/scratch/ebaldi/CODES/plumed2/sourceme.sh
#export PATH=/home/ebaldi/apps/plumed2/bin:${PATH}
#export LD_LIBRARY_PATH=/home/ebaldi/apps/plumed2/lib:${LD_LIBRARY_PATH}
#export PLUMED_KERNEL="/home/ebaldi/apps/plumed2/lib/libplumedKernel.so"

# Source module-environment init file
#source /etc/profile.d/modules.sh

# HDF5 library
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/ebaldi/lib/hdf5-1.8.16/lib
#export PATH=${PATH}:/home/ebaldi/lib/hdf5-1.8.16/bin

# Default editor: vim
export VISUAL=$(which gvim)
export EDITOR="$VISUAL"

# XRD lib dir
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/ebaldi/apps/xtclib/lib

# Bash prompt
source ~/.dotfiles/custom_prompt.sh

## Try to use powerline plugin; if not found, fall back to my old bash prompt
#if ! printenv | grep -q 'FROM_LOGIN=yes' && [[ -f $(which powerline-daemon 2>&1) ]]; then
#    powerline-daemon -q
#    POWERLINE_BASH_CONTINUATION=1
#    POWERLINE_BASH_SELECT=1
#    # If installed with anaconda
#    #. /home/ebaldi/scratch/apps/anaconda3/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
#    . /usr/share/powerline/bindings/bash/powerline.sh
#else
#    echo "Powerline Daemon NOT FOUND or logged in from SSH. Disabling Powerline." >&2
#    # personal color prompt style
#    source ~/.bash_prompt
#fi

# Dirty fix of compose key for GTK and QT apps which use SCIM instead of XIM
#export GTK_IM_MODULE=xim; export QT_IM_MODULE=xim

# Export correctly the LC_* variables
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#export LC_COLLATE=C

# Personal repository of LAMMPS potentials
export LAMMPS_POTENTIALS=${HOME}/workspace/EAMs

### INTEL software ###
export INTEL_PATH=/usr/local/intel
export COMPILERVARS_ARCHITECTURE="intel64"
export COMPILERVARS_PLATFORM="linux"
source ${INTEL_PATH}/bin/compilervars.sh
#source /opt/intel/intelpython3/bin/activate root
source ${INTEL_PATH}/vtune_amplifier_xe/amplxe-vars.sh

# CUDA
export CUDA_PATH=/usr/local/cuda
export PATH=${CUDA_PATH}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}

# PGI compiler
export PGI=${HOME}/scratch/apps/compilers_and_tools/pgi
export PATH=${PGI}/linux86-64/17.4/bin:${PATH}
export MANPATH=$MANPATH:${PGI}/linux86-64/17.4/man
export LM_LICENSE_FILE=$LM_LICENSE_FILE:${PGI}/license.dat

### END OF BASHRC ###
