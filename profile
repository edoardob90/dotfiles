#!/bin/bash
# set shell: zsh instead of bash
if case "$-" in *i*) true;; *) false;; esac &&
    [ -z "$ZSH_VERSION" ] &&
    type zsh >/dev/null 2>/dev/null; then
        export SHELL=$(which zsh)
        exec $(which zsh)
fi

# allow Chromium to use Flashplugin embedded in Chrome
export PEPPER_FLASH_VERSION=$(grep '"version":' /opt/google/chrome/PepperFlash/manifest.json | grep -Po '(?<=version": ")(?:\d|\.)*')
