# Aliases & functions
# history
function hs -d "Search through history"
    history | grep $argv
end

function hsi
    hs -i $argv
end

# macOS custom aliases
alias pypy='pypy3'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias ia='open -b pro.writer.mac -n'
alias marked='open -b com.brettterpstra.marked2'
alias wls='wolframscript'

# VIM/Neovim
command -q nvim; and abbr --add --global vim nvim && abbr --add --global vi nvim; or abbr --add --global vi vim

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
alias rbpi='/usr/bin/ssh rbpi'

if test "$TERM" = "xterm-kitty"
    function ssh -d "ssh if using Kitty terminal"
        kitty +kitten ssh $argv
    end
end

# Beancount
if set -q BEANCOUNT_LEDGER
    function bean-check
      command bean-check $BEANCOUNT_LEDGER $argv
    end
    
    function bean-report
      command bean-report $BEANCOUNT_LEDGER $argv
    end
    
    function fava
      command fava $BEANCOUNT_LEDGER $argv
    end
end

# Misc
alias cat='bat --theme DarkNeon'
function psq -d "Query running processes"
    ps ax | grep -v grep | grep -iE $argv
end
