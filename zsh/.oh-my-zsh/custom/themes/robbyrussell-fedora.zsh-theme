if [[ "$TERM" == "linux" ]]; then
  OS_ICON="%{$fg[cyan]%}> %{$fg[cyan]%}"
else
  OS_ICON="%{$fg[cyan]%} %{$fg[cyan]%}"
  if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    case "$ID" in
      arch)   OS_ICON="%{$fg[cyan]%} %{$fg[cyan]%}" ;;
      fedora) OS_ICON="%{$fg[red]%} %{$fg[red]%}" ;;
      debian) OS_ICON="%{$fg[red]%} %{$fg[red]%}" ;;
    esac
  fi
fi

PROMPT="${OS_ICON}%n%{$reset_color%} %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%} \$(git_prompt_info)"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
