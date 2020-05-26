# Env

. ~/.jfsenv-bootstrap

export ANDROID_HOME="/Users/${USER}/Library/Android/sdk"
export NODE_HOME="/usr/local/bin/node"
export NPM_HOME="/usr/local/bin/npm"

case $OSTYPE in
("darwin"*)
  export JAVA_HOME=$(/usr/libexec/java_home)
;;
esac

. "${jfs_dir_dotfiles_local_env}/.env"

export PATH="${PATH}:${MAVEN_HOME}/bin:${M2_HOME}:${GRADLE_HOME}/bin:${CHROMEDRIVER}:${NODE_HOME}:${NPM_HOME}:${ANDROID_HOME}/platform-tools:${JAVA_HOME}"


# Aliases

for aliasgroup in "${jfs_dir_dotfiles_aliases}/"*; do;
  . "$aliasgroup"
done

for aliasgroup in "${jfs_dir_dotfiles_local_aliases}/"*; do;
  . "$aliasgroup"
done

# Functions

for functiongroup in "${jfs_dir_dotfiles_functions}/"*; do;
  . "$functiongroup"
done

for functiongroup in "${jfs_dir_dotfiles_local_functions}/"*; do;
  . "$functiongroup"
done

# Prezto

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export HISTSIZE=100000
export SAVEHIST=100000

[[ -f "${jfs_dir_dotfiles}"/zsh/.p10k.zsh ]] && source "${jfs_dir_dotfiles}"/zsh/.p10k.zsh

# Z

case $OSTYPE in
("darwin"*)
  . `brew --prefix`/etc/profile.d/z.sh
;;
(*)
  . ~/z.sh
;;
esac

# forgit

. "${jfs_ns_app}"/forgit.plugin.zsh

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
