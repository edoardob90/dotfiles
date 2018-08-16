# Setup fzf
# ---------
if [[ ! "$PATH" == *"$DOTFILES"/fzf/bin* ]]; then
  export PATH="$PATH:$DOTFILES/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$DOTFILES/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$DOTFILES/fzf/shell/key-bindings.zsh"

