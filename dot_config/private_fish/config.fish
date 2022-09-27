function fish_greeting
    fortune 50% ~/.fortunes /usr/local/Cellar/fortune/9708/share/games/fortunes
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    # zoxide: smarter 'cd' command
    zoxide init fish | source
    # Pyenv
    pyenv init - | source
end

# # Set GNU binaries instead of BSD ones
# # NOTE: the following command requires fish > 3.2.0
# #       it's safe to place in fish.config, but it's better to run it ONCE interactively
# #       since it automatically export universal variables
# #
# for path in (find /usr/local/opt/ -type d -follow -name gnubin -print)
#   fish_add_path $path
# end
