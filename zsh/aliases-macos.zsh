# macOS custom aliases

# SSH
alias ssh-agent='/usr/bin/ssh-agent' # keep using macOS ssh agent even if openssh via Brew is installed
alias ssh-add='/usr/bin/ssh-add'
alias daint='ssh daint.cscs.ch'

# Syntax highlight in a shell
# requires Pygments
alias pcat='pygmentize -f terminal256 -O style=native -g'

# bat to replace cat
if type bat 2>&1 >/dev/null; then
    alias cat=bat
fi

# Search running processes for a pattern
alias 'ps?'="ps ax | grep -v grep | grep -iE"
alias psgrep='psgrep -saien'
