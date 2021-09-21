# Command abbreviations (from Jovica Ilic "Mastering Vim plugins")
setopt extendedglob
typeset -Ag abbreviations
abbreviations=(
    "ga"    "git add"
    "gco"   "git commit -a"
    "gcom"  "git commit -m"
    "gchm"  "git checkout master"
    "gche"  "git checkout"
    "gri"   "git rebase -i HEAD~"
    "grbm"  "git rebase origin/master"
    "gst"   "git status"
    "gs"    "git status -bs"
    "gps"   "git push"
    "gpu"   "git pull"
    "gfe"   "git fetch"
    "gfm"   "git fetch origin/master"
    "grv"   "git remote -v"
    "glog"  "git log"
    "gbra"  "git branch -a"
    "grem"  "git rm"
)
magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}
no-magic-abbrev-expand() {
  LBUFFER+=' '
}
zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
