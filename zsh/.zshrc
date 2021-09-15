# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DEFAULT_USER="$(whoami)"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  z
  zsh-autosuggestions
  git
  ssh-agent
  sudo
  npm
)

zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_gmail

source $ZSH/oh-my-zsh.sh

# - Environment Variables 
export DEVELOPMENT="$HOME/development"
export DOTFILES="$DEVELOPMENT/dotfiles"
export PYTHON="/usr/bin/python2"

export PATH="$PATH:$HOME/.dotnet/tools/"

# - Aliases 
alias dev='cd $DEVELOPMENT'
alias development='cd $DEVELOPMENT'
alias dotfiles='cd $DOTFILES'
alias python='python3'

alias dotfiles-commit='git -C $DOTFILES add --all && git -C $DOTFILES commit -m "Update" && git -C $DOTFILES push'
alias dotfiles-status='git -C $DOTFILES status'
alias dotfiles-update='git -C $DOTFILES pull && bash $DOTFILES/install.sh'

if [ ! -f $DOTFILES/zsh/.env.local ]; then
	source $DOTFILES/zsh/.env.local
fi

if [ ! -f .env.local ]; then
	source .env.local
fi


# - Settings 
bindkey '^ ' autosuggest-accept

# - Functions

# CTRL-Z out of vim and this makes CTRL-Z go back to vim again
function resume_foreground {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N resume_foreground
bindkey "^Z" resume_foreground

# - Startup

# Get latest changes commited dotfiles
git -C $DOTFILES fetch
result=$(git -C $DOTFILES log HEAD..origin/master --oneline)
if [[ "${result}" != "" ]]; then 
    dotfiles-update
    bashrc
fi

# Alert if dotfiles has uncommitted/unpushed changes
result=$(git -C $DOTFILES ls-files --modified --others --exclude-standard --directory)
if [[ "${result}" != "" ]]; then 
    printf "\033[0;31mThere are uncommited changes in the dotfiles repository: \n"
    printf "${result}\033[0m\n"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

alias luamake=/home/charlie/vendor/lua-language-server/3rd/luamake/luamake

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
