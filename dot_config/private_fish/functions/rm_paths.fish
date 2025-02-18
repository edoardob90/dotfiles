function rm_paths
    # Check if any arguments are provided
    if test (count $argv) -eq 0
        echo "Error: Please provide one or more paths to remove"
        return 1
    end

    # Check if first argument starts with --
    if string match -q -- '--*' $argv[1]
        echo "Error: First argument cannot be an option (--)"
        return 1
    end

    # Iterate through each provided path
    for path in $argv
        # Skip any argument that starts with --
        if string match -q -- '--*' $path
            echo "Warning: Skipping option '$path'"
            continue
        end

        if test -n "$path"
            set -e fish_user_paths[(contains -i $path $fish_user_paths)]
        end
    end

end
