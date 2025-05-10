if status is-interactive
    # Commands to run in interactive sessions can go here
end

set --export PATH "$HOME/.local/bin" $PATH
set --export PATH "$HOME/.cargo/bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
zoxide init fish | source
