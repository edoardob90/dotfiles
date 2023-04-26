# Fish-equivalent for ZSH abbreviations
abbr --add --global "ga"    git add
abbr --add --global "gco"   git commit -a
abbr --add --global "gca"   git commit -A
abbr --add --global "gcom"  git commit -m
abbr --add --global "gchm"  git checkout main
abbr --add --global "gck"   git checkout
abbr --add --global "gri"   git rebase -i HEAD~
abbr --add --global "grbm"  git rebase origin/main
abbr --add --global "gst"   git status
abbr --add --global "gs"    git status -bs
abbr --add --global "gps"   git push
abbr --add --global "gpu"   git pull
abbr --add --global "gfe"   git fetch
abbr --add --global "gfm"   git fetch origin/main
abbr --add --global "grv"   git remote -v
abbr --add --global "gl"    "git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
abbr --add --global "grl"   git reflog
abbr --add --global "gbra"  git branch -a
abbr --add --global "grm"   git rm
abbr --add --global "gsh"   git stash list

