if [[ "$TERM" == "linux" ]]; then
  local distro_icon="[fedora]"
else
  local distro_icon=$'\uf30a' # Ícone Nerd Font do Fedora ()
fi

PROMPT="%F{33}${distro_icon} %n%f %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%} \$(git_prompt_info)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
