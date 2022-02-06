# Linux custom aliases

# SSH shortcuts
alias daint='ssh daint.cscs.ch'
# When using kitty terminal emulator, alias ssh to have terminfo file available on the server
if [[ "$TERM" == "xterm-kitty" ]]; then
    alias ssh='kitty +kitten ssh'
fi

# ls
alias ls='ls -G --color=auto'
alias lls='ls -lart'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lrt='ls -lrth'

# Nord VPN
alias vpn=nordvpn

# VIM/Neovim
alias vi=nvim
alias vim=nvim
