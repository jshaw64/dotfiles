# Private

. "/Users/${USER}/.jfsenv"


# Aliases

for aliasgroup in "/Users/${USER}/dotfiles/zsh/aliases/"*; do;
  . "$aliasgroup"
done

for aliasgroup in "${dotfiles_local_dir_aliases}/"*; do;
  . "$aliasgroup"
done

# Functions

for functiongroup in "/Users/${USER}/dotfiles/zsh/functions/"*; do;
  . "$functiongroup"
done

for functiongroup in "${dotfiles_local_dir_functions}/"*; do;
  . "$functiongroup"
done

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

# zsh hooks

function chpwd()
{
  ls -Alth
}
