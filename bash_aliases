#!/bin/bash
# Functions
open_something () {
    xdg-open ${1:-$PWD}
}

deneb_cluster () {
    ssh -Y -F "${HOME}/.ssh/config" deneb${1:-1}
}

#alias cdlocal='cd /local/scratch/ebaldi/ ; pwd'
alias open='open_something'
alias vi='vim'
alias rm='rm -i'
alias rmf='rm -f'

# Clusters
alias deneb='deneb_cluster' # uses SSH per-user config file
alias accessrv='ssh -X ebaldi@accessrv2.epfl.ch'
alias bellatrix='ssh -X ebaldi@bellatrix.epfl.ch'
alias aries='ssh -X ebaldi@aries.epfl.ch'
alias lsmx2='ssh lsmx2'
alias lsmx1='ssh lsmx1'
alias fidis='ssh fidis'

# Pacman (every command is starting with caps 'P')
#alias Pacup='sudo pacman -Syu' # perform full system upgrade
#alias Pacin='sudo pacman -S' # install
#alias Pacss='pacman -Ss' # search
#alias Pacsi='pacman -Si' # info
#alias Pacrm='sudo pacman -Rn' # remove package & unused dep
#alias Paclo='pacman -Qdt' # list orphans
#alias Pacro='Paclo && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
#alias Pacc='pacman -Scc' # clean cache
#alias Paclf='pacman -Ql' # list files

# Copying remotely
remote_copy () {
    # From/to
    local WAY=$1
    if [[ "$WAY" != "from" || "$WAY" != "to" ]]; then
        echo "ERROR: must specify 'to' or 'from' as first argument!" >&2; exit 1
    fi
    # Command
    local CPTOOL=${2:-rsync}
    # Places
    local REMOTE=$3 # which machine
    local FILE=$4 # what file/folder
    local WHERE=$5 # path on the remote target
    # Copy
    if [[ "$CPTOOL" -eq "rsync" ]]; then
        local OPTS="-avz --progress"
    else
        local OPTS="-a" # usually it means using scp
    fi
    if [[ "$WAY" == "to" ]]; then
        echo "Copying $FILE to $REMOTE ..." >&2
        $CPTOOL $OPTS $FILE "${USER}@${REMOTE}.epfl.ch:${WHERE}"
    elif [[ "$WAY" == "from" ]]; then
        echo "Copying $FILE from $REMOTE ..." >&2
        $CPTOOL $OPTS "${USER}@${REMOTE}.epfl.ch:${FILE} ${WHERE}"
    fi
}
