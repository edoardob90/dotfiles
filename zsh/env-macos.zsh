# Environment file for macOS

# Replace default macOS utils (e.g., grep, sed, awk) with GNU core utils
# brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Set up Python `virtualenvwrapper`
# This MUST BE COMMENTED if pyenv-virtualenv plugin is installed
#export WORKON_HOME=~/.virtualenvs
#[[ ! -d "$WORKON_HOME" ]] && mkdir -p $WORKON_HOME
#if command -v pyenv 1>/dev/null 2>&1; then
#    source $(pyenv which virtualenvwrapper.sh)
#else
#    echo "WARNING: pyenv not found. Install with 'brew install pyenv' and set a global Python version" >&2
#fi

