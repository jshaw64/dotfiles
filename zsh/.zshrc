# Private

. "/Users/${USER}/.jfsenv"

export ANDROID_HOME="/Users/${USER}/Library/Android/sdk"
export JAVA_HOME=$(/usr/libexec/java_home)
export NODE_HOME="/usr/local/bin/node"
export NPM_HOME="/usr/local/bin/npm"

export PATH="${PATH}:${NODE_HOME}:${NPM_HOME}:${ANDROID_HOME}/platform-tools:${JAVA_HOME}"


# Aliases

for aliasgroup in "${dotfiles_pub_dir_aliases}/"*; do;
  . "$aliasgroup"
done

for aliasgroup in "${dotfiles_local_dir_aliases}/"*; do;
  . "$aliasgroup"
done

# Functions

for functiongroup in "${dotfiles_pub_dir_functions}/"*; do;
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
