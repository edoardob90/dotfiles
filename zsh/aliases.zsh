# My custom aliases
# This file resides in $DOTDIR/zsh so that I avoid having to commit to the zprezto repository every time I add an alias
#
# VIM
if type nvim 2>&1 >/dev/null; then
    alias vi=nvim
    alias vim=nvim
else
    alias vi=vim
fi

# SSH
function deneb_cluster () {
    ssh -Y -F "${HOME}/.ssh/config" deneb${1:-1}
}

alias cosmo='ssh cosmopc'
alias deneb1='deneb_cluster 1' # uses SSH per-user config file
alias deneb2='deneb_cluster 2' # uses SSH per-user config file
alias accessrv='ssh -X ebaldi@accessrv2.epfl.ch'
alias lsmx2='ssh lsmx2'
alias lsmx1='ssh lsmx1'
alias fidis='ssh fidis'

alias daint='ssh daint.cscs.ch'

# ls
alias ls='ls -G --color=auto'
alias lls='ls -lart'

# Use 'bat' instead of 'cat' if installed
# brew install bat
if type bat 2>&1 >/dev/null; then
    alias cat=bat
fi

# Open man for GNU command with GNU Man bin; otherwise fallback to macOS version
if [[ $(uname) == 'Darwin' ]]; then
    # The following command has problems with zsh highlight plugin
    #alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0  ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi  }; _'
fi

# history alias (from Oh-My-Zsh plugin)
function hs
{
    history 0 | grep $*
}
alias h='history 0'
alias hsi='hs -i'

# Path shortcuts
alias phdth='cd ~/Documents/PhD/PhD-Thesis/'

