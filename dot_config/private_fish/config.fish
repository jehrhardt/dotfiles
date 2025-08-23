if status is-interactive
    alias l="eza --all --icons --long --git"

    set -gx EDITOR nvim

    source "$HOME/.cargo/env.fish"
    atuin init fish | source
    mise activate fish | source
    zoxide init fish | source
    chezmoi completion fish | source
    starship init fish | source
end
