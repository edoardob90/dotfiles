### Quick setup

Two ways:

1. With the install script: `curl -sSL https://raw.githubusercontent.com/edoardob90/dotfiles/zprezto/install.sh -o install.sh && . ./install.sh`

2. Manually (suggested if the machine needs a particular setup)


### To update

The `dotfiles` repo contains several submodules. To update everything in the correct way, do

```
cd "$DOT_DIR"
git pull
git submodule update --init --recursive
```

The lines above will update **both** the main repo and the `zprezto` submodule which contains the actual configuration files and modules for my ZSH setup. Alternatively, with the simple `zprezto-update` only the `zprezto` submodule gets updated. **Bear in mind** that the updates are checked against the `origin` remote, that is, my personal fork of prezto and **not** from the upstream. Updating from the upstream must be done manually:

```
cd $ZPREZTODIR
git pull upstream master
git submodule update --init --recursive
```


### Log

**Update: 29/04/2020**

Switched to [this](https://github.com/ssh0/dot) dotfiles manager since it's written in Shell script and it will be more cross-platform compatible with servers and other machines.

**Update: 14/04/2020**

~~Using [dot](https://github.com/ubnt-intrepid/dot) to manage symbolic links. If you have Rust installed: `cargo install --git https://github.com/ubnt-intrepid/dot.git`.~~
