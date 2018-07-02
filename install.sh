#!/bin/bash
for file in bash* profile zshrc inputrc; do
    if [[ ! -f "$HOME/$file" ]]; then
        ln -s ${PWD}/$(basename ${file}) ${HOME}/.${file}
    else
        echo "File ${file} already exists in home directory!" >&2
    fi
done
exit 0
