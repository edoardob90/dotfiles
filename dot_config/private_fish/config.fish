if status is-interactive
    # Commands to run in interactive sessions can go here
    # zoxide: smarter 'cd' command
    zoxide init fish | source
    # Pyenv
    pyenv init - | source
end
