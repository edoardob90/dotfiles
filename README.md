# My `dotfiles`

On **September 21, 2021** I cleaned up and migrated my dotfiles to use [`chezmoi`](https://github.com/twpayne/chezmoi). It better handles multi-machine settings, secret files, supports encryption and custom templates.

### Useful commands to remember

- `chezmoi cd`: spawn a new shell and change to source directory
- `chezmoi edit <file>`: edit a file with the configured editor from the source dir
- `chezmoi edit-config`: edit the `~/.config/chezmoi/chezmoi.toml` (this file is **not** managed/uploaded to GitHub)
- `chezmoi add <file>`: add a new file/folder
- `chezmoi apply`: apply the source dir state to the target dir (default is `$HOME`)
- `chezmoi apply --refresh-externals`: apply the source state by updating any external file or folder configured in `.chezmoiexternal.toml`

### Installing `chezmoi`

- One-liner for a single binary install: `sh -c "$(curl -fsLS git.io/chezmoi)"` or `sh -c "$(wget -qO - git.io/chezmoi)"`
- Package manager install:
   - macOS: `brew install chezmoi`
   - Void Linux: `xbps-install -S chezmoi`
   - Ubuntu or other Linux distro, via [Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux): `brew install chezmoi`

### New machine setup

- `chezmoi --init edoardob90`: to initialize the local source state from the default repo
- `chezmoi --init --apply edoardob90`: init & apply the source state

### Update (i.e., `git pull`)

`chezmoi update`

## TODO

I still have to include in the new repo:

- [ ] SSH public keys
- [ ] Void Linux workstation: Herbstluftwm
