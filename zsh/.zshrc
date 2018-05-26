# Prezto

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Z

. `brew --prefix`/etc/profile.d/z.sh
export _Z_DATA=~/dotfiles/z/.z
