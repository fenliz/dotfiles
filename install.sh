DOTFILES=/home/charlie/development/dotfiles
source $DOTFILES/install.helpers.sh

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
    
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        info "- ohmyzsh: Installing..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    else
        info "- ohmyzsh: Already installed"
	fi

    if [ ! -d "$HOME/.tmux" ]; then
		info "- tmux: Installing..."
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	else
		info "- tmux: Already installed"
	fi
}

section "Setup configuration..." && {
    info "- git: link .gitconfig"
    link_file "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

    info "- zsh: .zshrc"
    link_file "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

    info "- zsh: set as default shell"
    sudo chsh -s $(which zsh) $(whoami)

    info "- Windows Terminal: settings.json"
    copy_file "$DOTFILES/windowsterminal/settings.json" "$LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

	info "- tmux: .tmux.conf"
	link_file "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

    info "- NVIM: .config/nvim"
    link_file "$DOTFILES/nvim" "$HOME/.config/nvim"
}

if [ $SHELL = "/bin/bash" ]; then
    title "Done, Please restart the shell!"
else
    title "Done!"
fi
