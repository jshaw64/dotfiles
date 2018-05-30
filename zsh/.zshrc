# Private

. "/Users/${USER}/dotfiles/private_config"

# Prezto

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Z

. `brew --prefix`/etc/profile.d/z.sh
export _Z_DATA=~/dotfiles/z/.z

# nvm

export NVM_DIR="/Users/${USER}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
