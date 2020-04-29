#!/usr/bin/env bash

set -e
set -u
set -o pipefail

is_app_installed() {
  type "$1" &>/dev/null
}

REPODIR="$(cd "$(dirname "$0")"; pwd -P)"
cd "$REPODIR"

# check if 'git' is available
if ! is_app_installed git; then
    echo "ERROR: 'git' is not installed or not in PATH!" >&2
    exit 2
fi

# check if 'dot' is already available. if yes, it's probably a mistake running this script
if is_app_installed dot; then
    echo "WARNING: 'dot' seems to be already available. It's probably a mistake running this script!" >&2
    exit 1
fi

# check if a '.dotfiles' direcotry already exists
if [ -e "$HOME/.dotfiles" ]; then
    echo "WARNING: .dotfiles already exists in HOME. Renaming it to .dotfiles.bck" >&2
    echo "Duplicate symlinks will be managed by dot" >&2
    if [ -e "$HOME/.dotfiles.bck" ]; then
        echo "ERROR: backup directory .dotfiles.bck already exists! I'm not overwriting, move it manually and re-run the script" >&2
        exit 2
    fi
    mv -f $HOME/.dotfiles $HOME/.dotfiles.bck
else
    git clone --recursive https://github.com/edoardob90/dotfiles.git .dotfiles
fi

# a temporary environment
export DOT_DIR="$HOME/.dotfiles"
[ ! -z $ZSH_VERSION ] && fpath=($HOME/.dotfiles/dotfiles-manager $fpath)
source $HOME/.dotfiles/dotfiles-manager/dot.sh

echo "'dot' should be available. Check with 'dot --help-all'" >&2
echo "Run 'dot set' to create symbolic links according to 'dotlink' file(s)" >&2

exit 0
