if status is-interactive
    # Commands to run in interactive sessions can go here
    # zoxide: smarter 'cd' command
    zoxide init fish | source
end

# # Set GNU binaries instead of BSD ones
# # NOTE: the following command requires fish > 3.2.0
# #       it's safe to place in fish.config, but it's better to run it ONCE interactively
# #       since it automatically export universal variables
# #
# for path in (find /usr/local/opt/ -type d -follow -name gnubin -print)
#   fish_add_path $path
# end

# Override default bindings of fzf.fish plugin
# Changes Ctrl+Alt to Shift+Alt
# Alt = Option on macOS
# Defaults:
#   Ctrl + R = history search
#   Ctrl + V = variables
# fzf_configure_bindings \
#     # Shift + Alt + F = directories
#     --directory=\u00CF \
#     # Shift + Alt + S = git status
#     --git_status=\u00CD \
#     # Shift + Alt + P = processes
#     --processes=\u220F \
#     # Shift + Alt + L = git log
#     --git_log=\u00D2


# Add ~/.local/bin to PATH
fish_add_path -m ~/.local/bin/

