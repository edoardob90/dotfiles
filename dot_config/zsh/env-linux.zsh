# Environment file for Linux distributions

# Setup Linuxbrew
function brew_disable() {
    export PATH=${PATH##*"/.linuxbrew/bin:"}
    export PATH=${PATH##*"/.linuxbrew/sbin:"}
    export MANPATH=${MANPATH##*"/.linuxbrew/share/man:"}
    export INFOPATH=${INFOPATH##*"/.linuxbrew/share/info:"}
}
function brew_enable() {
    BREW='/home/linuxbrew/.linuxbrew'
    brew_disable
    export PATH="$BREW/bin:$BREW/sbin:$PATH"
    export MANPATH="$BREW/share/man:$MANPATH"
    export INFOPATH="$BREW/share/info:$INFOPATH"
    export HOMEBREW_NO_AUTO_UPDATE=1
}
brew_enable

# McFly
eval "$($(brew --prefix)/bin/mcfly init zsh)"

# Zoxide
eval "$($(brew --prefix)/bin/zoxide init zsh)"
