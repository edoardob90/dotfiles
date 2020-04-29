# Custom aliases
#
# VIM/Neovim
if type nvim 2>&1 >/dev/null; then
    alias vi=nvim
    alias vim=nvim
else
    alias vi=vim
fi

# SSH shortcuts
alias daint='ssh daint.cscs.ch'

# ls
alias ls='ls -G --color=auto'
alias lls='ls -lart'

# cat
# Use 'bat' instead of 'cat' if installed
# On macOS: brew install bat
if type bat 2>&1 >/dev/null; then
    alias cat=bat
fi

# History
function hs {
    history 0 | grep $*
}
alias h='history 0'
alias hsi='hs -i'

# Nord VPN
alias vpn=nordvpn

# Source a local file for aliases
# This file SHOULD NEVER BE ADDED to the Git repo to avoid errors
[ -f "$DOTDIR/zsh/aliases.local.zsh" ] && source $DOTDIR/zsh/aliases.local.zsh
