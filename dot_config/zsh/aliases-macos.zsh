# macOS custom aliases
alias tmp='cd ~/tmp'
alias pypy='pypy3'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias ia='open -b pro.writer.mac -n'
alias marked='open -b com.brettterpstra.marked2'
alias screen='/usr/local/bin/screen'
alias wls='wolframscript'

# ls
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lrt='ls -lrth'

# SSH
alias ssh-agent='/usr/bin/ssh-agent' # keep using macOS ssh agent even if openssh via Brew is installed
alias ssh-add='/usr/bin/ssh-add'
alias daint='ssh daint.cscs.ch'
alias router='/usr/bin/ssh router'

# When using kitty terminal emulator, alias ssh to have terminfo file available on the server
if [[ "$TERM" == "xterm-kitty" ]]; then
    alias ssh='kitty +kitten ssh'
fi

# Syntax highlight in a shell
# requires Pygments
alias pcat='pygmentize -f terminal256 -O style=native -g'

# bat to replace cat
if type bat 2>&1 >/dev/null; then
    alias cat=bat
fi

# Search running processes for a pattern
alias psq="ps ax | grep -v grep | grep -iE"
alias psgrep='psgrep -saien'

