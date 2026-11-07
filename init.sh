
#!/usr/bin/env bash
set -euo pipefail

install_stow() {
    if command -v stow &>/dev/null; then
        return
    fi

    echo "Installing GNU Stow..."

    if command -v brew &>/dev/null; then
        brew install stow
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update
        sudo apt-get install -y stow
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y stow
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --needed --noconfirm stow
    else
        echo "Error: Unsupported package manager."
        exit 1
    fi
}

main() {
    cd "$(dirname "$0")"

    install_stow

    stow -t "$HOME" zsh oh-my-zsh

    echo "Dotfiles initialized successfully!"
}

main "$@"
