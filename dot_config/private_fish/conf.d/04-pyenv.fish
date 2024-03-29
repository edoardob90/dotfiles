function verlte
    [ $argv[1] = (echo -e "$argv[1]\n$argv[2]" | sort -V | head -n1) ]
end

set -q PYENV_ROOT; or set -Ux PYENV_ROOT $HOME/.pyenv

if verlte "3.2.0" $FISH_VERSION
    fish_add_path $PYENV_ROOT/bin
else
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end

# Init pyenv-virtualenv
status --is-interactive; and source (pyenv virtualenv-init - | psub)

