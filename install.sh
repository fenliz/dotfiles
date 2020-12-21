source ./installer/variables.sh
source ./installer/functions.sh

title "Development setup script..."

section "Updating the linux distribution" && {
    sudo apt update -y -qq
    sudo apt upgrade -y -qq
}

section "Settings environment variables" && {
    set_environment_variable DOTFILES "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    set_environment_variable APPDATA $(wslpath "$(wslvar APPDATA)")
    set_environment_variable LOCALAPPDATA $(wslpath "$(wslvar LOCALAPPDATA)")
}

section "Installing software..." && {
    try_install_software git
    try_install_software zsh
}

section "Setup Configuration..." && {
    info "- git: .gitconfig"
    link_file "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

    info "- zsh: .zshrc"
    link_file "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

    info "- Windows Terminal: settings.json"
    copy_file "$DOTFILES/windowsterminal/settings.json" "$LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
}

title "Done!"