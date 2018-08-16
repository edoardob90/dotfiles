# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ebaldi/.dotfiles/fzf/bin* ]]; then
  export PATH="$PATH:/home/ebaldi/.dotfiles/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ebaldi/.dotfiles/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ebaldi/.dotfiles/fzf/shell/key-bindings.zsh"

