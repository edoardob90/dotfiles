# Custom alias files
# This file should be either symlinked in ${HOME} or in ${DOTFILES}/zsh
#
# VIM
if type nvim 2>&1 >/dev/null; then
    alias vi=nvim
    alias vim=nvim
else
    alias vi=vim
fi

# History
function hs {
    history 0 | grep $*
}
alias hsi='hs -i'

# SSH
alias daint='ssh daint.cscs.ch'

# Syntax highlight in a shell
# requires Pygments
alias pcat='pygmentize -f terminal256 -O style=native -g'

# bat to replace cat
if type bat 2>&1 >/dev/null; then
    alias cat=bat
fi

# Search running processes for a pattern
alias ps?="ps ax | grep -v grep | grep -iE"
alias psgrep='psgrep -saien'

