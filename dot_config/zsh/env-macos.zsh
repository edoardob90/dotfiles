# Environment file for macOS

# Replace default macOS utils (e.g., grep, sed, awk) with GNU core utils
# brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Make sure that ~/bin is *always* searched first
export PATH=${HOME}/bin:${PATH}

# GPG tty
# gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

# PyPy3: packages installed via pip_pypy3 should be found *AFTER* CPython's
export PATH=${PATH}:/usr/local/share/pypy3

# McFly: command history search
# https://github.com/cantino/mcfly
eval $($(brew --prefix)/bin/mcfly init zsh)
