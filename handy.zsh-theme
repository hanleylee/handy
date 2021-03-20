# Author: Hanley Lee
# Website: https://www.hanleylee.com
# GitHub: https://github.com/HanleyLee

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

local exit_code="%F{red}%(?..%?)%f"

# 在屏幕右侧显示命令时间
local hl_time_on_right='$(align_right " `get_date_time`")'

function get_space_size() {
    # ref: http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
    local str="$1"
    local zero_pattern='%([BSUbfksu]|([FB]|){*})'
    local len=${#${(S%%)str//$~zero_pattern/}}
    local size=$(( $COLUMNS - $len ))
    echo "$size"
}

function align_right() {
    local str="$1"
    local align_site=`get_space_size "$str"`
    local cursor_back="\033[${align_site}G"
    local cursor_begin="\033[1G"
    echo "${cursor_back}${str}${cursor_begin}"
}

function get_date_time() {
    command date "+%H:%M:%S"
}
function _fish_collapsed_pwd() {
    local pwd="$1"
    local home="$HOME"
    local size=${#home}
    [[ $# == 0 ]] && pwd="$PWD"
    [[ -z "$pwd" ]] && return
    if [[ "$pwd" == "/" ]]; then
        echo "/"
        return
    elif [[ "$pwd" == "$home" ]]; then
        echo "~"
        return
    fi
    [[ "$pwd" == "$home/"* ]] && pwd="~${pwd:$size}"
    if [[ -n "$BASH_VERSION" ]]; then
        local IFS="/"
        local elements=($pwd)
        local length=${#elements[@]}
        for ((i=0;i<length-1;i++)); do
            local elem=${elements[$i]}
            if [[ ${#elem} -gt 1 ]]; then
                elements[$i]=${elem:0:1}
            fi
        done
    else
        local elements=("${(s:/:)pwd}")
        local length=${#elements}
        for i in {1..$((length-1))}; do
            local elem=${elements[$i]}
            if [[ ${#elem} > 1 ]]; then
                elements[$i]=${elem[1]}
            fi
        done
    fi
    local IFS="/"
    echo "${elements[*]}"
}
# Prompt format:
# PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] C:LAST_EXIT_CODE
# $ COMMAND

# For example:
# % ys in ~/.oh-my-zsh on git:master x [21:47:42] C:0
# $
PROMPT="
%F{yellow}%n%f@%F{magenta}%m%f \
%F{cyan}%B%~%f%b\
$git_info  $exit_code  $hl_time_on_right
%F{green}$%f 
"

