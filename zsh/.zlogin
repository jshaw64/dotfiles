{
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

if (( $+commands[fortune] )); then
  if [[ -t 0 || -t 1 ]]; then
    fortune -a computers linuxcookie
    print
  fi
fi
