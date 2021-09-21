# My `dotfiles`

On **September 21, 2021** I cleaned up and migrated my dotfiles to use [`chezmoi`](https://github.com/twpayne/chezmoi). It better handles multi-machine settings, secret files, supports encryption and custom templates.

### Useful commands to remember

- `chezmoi cd`: spawn a new shell and change to source directory
- `chezmoi edit <file>`: edit a file with the configured editor from the source dir
- `chezmoi edit-config`: edit the `~/.config/chezmoi/chezmoi.toml` (this file is **not** managed/uploaded to GitHub)
- `chezmoi add <file>`: add a new file/folder
- `chezmoi apply`: apply the source dir state to the target dir (default is `$HOME`)
- `chezmoi apply --refresh-externals`: apply the source state by updating any external file or folder configured in `.chezmoiexternal.toml`

### New machine setup

`sh -c "$(curl -fsLS git.io/chezmoi)" --init --apply edoardob90`

### Update (i.e., `git pull`)

`chezmoi update`

## TODO

I still have to include in the new repo:

- [ ] SSH public keys
- [ ] Void Linux workstation: Herbstluftwm