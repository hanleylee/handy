# Author: Hanley Lee
# Website: https://www.hanleylee.com
# GitHub: https://github.com/HanleyLee

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[magenta]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# 使用了三元运算符 %(?.<true expression>.<false expression>)
local exit_code='%(?.%F{green} ✔︎ 0.%F{red} ✘ %?)%f'

# Prompt on left of screen
PROMPT="\
%F{yellow}%n%f%F{grey}@%f%F{green}%m%f %F{blue}%B%~%b%f $git_info  $exit_code
%F{green}\$%f \
"

# Prompt on right of screen
RPROMPT='%*'

# For example:
# hanley@Hanleys-Mac-mini-home ~/.sh  on git:main x   ✘ 1                   21:47:42
# $
