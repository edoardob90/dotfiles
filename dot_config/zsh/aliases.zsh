# Custom aliases
# These are OS-independent

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

# IPython
alias ipy=ipython
alias tmux-jpy='tmux attach -t jupyter || tmux new-session -A -s jupyter'

# Source OS-specific alias file
# Leave this AT THE BOTTOM
if [[ -f "$HOME/.aliases.local.zsh" ]]; then source "$HOME/.aliases.local.zsh"; fi
