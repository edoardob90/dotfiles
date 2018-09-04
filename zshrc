#========= My ZSHRC =========
#
# Terminal colors
# MAY CAUSE problems with TMUX and gnome-terminal
#export TERM=xterm-256color-italic
#export TERM=screen-256color
#export EDITOR=vim

# VIM colorscheme 'gruvbox' color palette
# Useless if using VIM with termguicolors support (as I'm doing, since I'm using my compiled version of VIM)
#source $HOME/.vim/myplugins/gruvbox/gruvbox_256palette.sh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.dotfiles/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="purity"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(debian history zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration
export DOTFILES="$HOME/.dotfiles"

# Adding personal zfunctions path
fpath=( "$DOTFILES/myzfunctions" $fpath )

# Set prompt theme
# Using theme 'Pure' (submodule). Must be here AFTER sourcing oh-my-zsh.sh script.
#ZSH_THEME=""
#autoload -U promptinit; promptinit
#PURE_PROMPT_SYMBOL=">"
#prompt pure

# Default editor: vim
export VISUAL=$(which nvim)
export EDITOR="$VISUAL"

# ============= PATH env variable =============
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#     In the file /etc/paths you can add,
#     one per line, paths to be automatically 
#     exported into the PATH variable
#     Alternatively, one file per program 
#     in the folder /etc/paths.d/
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
# Brew: use non-prefixed GNU utils
# >>> All commands have been installed with the prefix 'g'.
# >>> If you really need to use these commands with their normal names, you
# >>> can add a "gnubin" directory to your PATH from your bashrc like:
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# >>> Additionally, you can access their man pages with normal names if you add
# >>>the "gnuman" directory to your MANPATH from your bashrc as well:
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"


# INTEL software
#export COMPILERVARS_ARCHITECTURE="intel64"
#export COMPILERVARS_PLATFORM="linux"
#source ${INTEL_PATH}/bin/compilervars.sh

# INTEL Python distribution (deprecated?)
##source /opt/intel/intelpython3/bin/activate root
#if [[ $(uname -m) == "x86_64" ]]; then
#    export PATH="/usr/local/intel/vtune_amplifier_xe_2017.5.0.526192/bin64":${PATH}
#fi

# CUDA
export CUDA_PATH=/usr/local/cuda
export PATH=${CUDA_PATH}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}

# PGI compiler
#export PGI=${HOME}/scratch/apps/compilers_and_tools/pgi
#export PATH=${PGI}/linux86-64/17.4/bin:${PATH}
#export MANPATH=$MANPATH:${PGI}/linux86-64/17.4/man
#export LM_LICENSE_FILE=$LM_LICENSE_FILE:${PGI}/license.dat

#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
#
# LAMMPS potentials directory
export LAMMPS_POTENTIALS=${HOME}/potentials

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[[ -f $ZSH_CUSTOM/aliases ]] && . $ZSH_CUSTOM/aliases
if [[ -d $ZSH_CUSTOM/aliases.d ]]; then
    for f in $ZSH_CUSTOM/aliases.d/* ; do
        . $f
    done
fi


# Completion stuff
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(gdircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Command abbreviations (from Jovica Ilic "Mastering Vim plugins")
setopt extendedglob
typeset -Ag abbreviations
abbreviations=(
    "ga"    "git add"
    "gco"   "git commit -a"
    "gcom"  "git commit -m"
    "gcm"   "git checkout master"
    "gce"   "git checkout"
    "gri"   "git rebase -i HEAD~"
    "grbm"   "git rebase origin/master"
    "gst"   "git status"
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

# Base16 shell colors
# SOURCE: https://github.com/chriskempson/base16-shell
BASE16_SHELL="$DOTFILES/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Base16-shell configuration
BASE16_SHELL="$DOTFILES/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
# Fzf 'fuzzy finding' plugin (vim & shell)
[ -f "$DOTFILES/fzf.zsh" ] && source "$DOTFILES/fzf.zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

