# Pro-tip: use fish_add_path to edit the PATH variable in this config file
# DO NOT MANUALLY EDIT $PATH IN THIS FILE!!!!
# etc: fish_add_path $HOME/.cargo/bin

# Remove fish greeting
set -g fish_greeting

if status is-interactive
    # Setup Common Paths
    set FISH_PATH $HOME/.config/fish

    if ! set -q MYVIMRC
        set -x MYVIMRC $XDG_CONFIG_HOME/nvim/init.vim
    end

    if ! set -q SRC_PATH
        set -x SRC_PATH $HOME/Source
    end

    if ! set -q DOTFILES
        set -x DOTFILES $SRC_PATH/dotfiles
    end

    set --export PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc

    # macOS Specific thangs
    if test (uname) = "Darwin"
        alias updatedb="sudo /usr/libexec/locate.updatedb"
        if test -e /opt/homebrew/bin
            fish_add_path /opt/homebrew/bin
        end
        if test -e $HOME/Library/Python/3.9/bin
            fish_add_path $HOME/Library/Python/3.9/bin
        end
    end

    # Aliases
    # alias ll='ls -lhAF'
    alias mongo='mongosh'

    # Set Abbreviations
    if test -f $FISH_PATH/abbrevs.fish
        source $FISH_PATH/abbrevs.fish
    end

    # Set pyenv

    # Set PATH
    if test -e $FISH_PATH/paths.fish
        source $FISH_PATH/paths.fish
    end

    if test -e $FISH_PATH/pyenv.fish
        source $FISH_PATH/pyenv.fish
    end

    # Starship Prompt Setup
    starship init fish | source
end
