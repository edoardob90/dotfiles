# Custom aliases
# This file is sourced BEFORE ${DOTDIR}/zsh/aliases.zsh, if any of these exist
# In this way, I avoid committing to the Git repo every time I make a machine-dependent change
# This file resides in ${DOTDIR}/zsh/.aliases.zsh and is symlinked in ${HOME} with GNU Stow
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
