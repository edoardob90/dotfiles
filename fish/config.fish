# Fish configuration file
# Variables
set -x PATH $HOME/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -Ux PAGER less
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Aliases & functions
function hs -d 'search in command history'
    history search $argv
end

#function cat -d 'shortcut for bat'
#    bat $argv
#end

function vi -d 'vi alias for nvim'
    nvim $argv
end

function vim -d 'vi alias for nvim'
    nvim $argv
end

function update -d "update brew, fish, fisher and mac app store"
    echo 'start updating ...'

    echo 'updating homebrew'
    brew update
    brew upgrade
    brew cleanup

    echo 'updating fish shell'
    fisher
    fish_update_completions

    echo 'checking Apple Updates'
    /usr/sbin/softwareupdate -ia

    exit 0
end

function sa -d "Search through aliases"
    alias | grep -i $argv
end

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end

# Brew: add /usr/local/sbin to PATH
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
