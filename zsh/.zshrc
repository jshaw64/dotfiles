# Env

. ~/Documents/jfs/global/dotfiles-private/.jfsenv

export ANDROID_HOME="/Users/${USER}/Library/Android/sdk"
export NODE_HOME="/usr/local/bin/node"
export NPM_HOME="/usr/local/bin/npm"

case $OSTYPE in
("darwin"*)
  export JAVA_HOME=$(/usr/libexec/java_home)
;;
esac

. "${dotfiles_local_dir_env}/.env"

export PATH="${PATH}:${MAVEN_HOME}/bin:${M2_HOME}:${GRADLE_HOME}/bin:${CHROMEDRIVER}:${NODE_HOME}:${NPM_HOME}:${ANDROID_HOME}/platform-tools:${JAVA_HOME}"


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

export HISTSIZE=100000
export SAVEHIST=100000

# Z

case $OSTYPE in
("darwin"*)
  . `brew --prefix`/etc/profile.d/z.sh
;;
(*)
  . ~/z.sh
;;
esac

export _Z_DATA=~/z/.z

# nvm

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh hooks

function chpwd()
{
  ls -Alth
}
