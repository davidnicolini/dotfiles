if [[ "$TERM" == "linux" ]]; then
  # Fallback para TTY fisico
  PROMPT="%{$fg_bold[blue]%}[arch] %n %(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> )%{$fg[cyan]%}%c%{$reset_color%}"
else
  # Terminal grafico (Kitty) com Nerd Font
  PROMPT="%{$fg_bold[blue]%} %n %(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
fi

PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
