#!/bin/bash
for file in $(ls -1 | grep 'bash'); do
    if [[ ! -f "$HOME/$file" ]]; then
        ln -s ${PWD}/$(basename $file) ${HOME}/$file
    else
        echo "File $file already exists in home directory!" >&2
    fi
done
exit 0
