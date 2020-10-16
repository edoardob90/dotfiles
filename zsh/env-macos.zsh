# Environment file for macOS

# Replace default macOS utils (e.g., grep, sed, awk) with GNU core utils
# brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Make sure that ~/bin is *always* searched first
export PATH=${HOME}/bin:${PATH}
