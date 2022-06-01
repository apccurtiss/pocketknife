export VISUAL=vim
export EDITOR="$VISUAL"

## Prompt
# Text format
normal="\[\e[0m\]"
bold="\[\e[1m\]"
underline="\[\e[4m\]"

# Text color
black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
brown="\[\e[33m\]"
blue="\[\e[34m\]"
purple="\[\e[35m\]"
cyan="\[\e[36m\]"
white="\[\e[37m\]"

# Background color
b_black="\[\e[40m\]"
b_red="\[\e[41m\]"
b_green="\[\e[42m\]"
b_brown="\[\e[43m\]"
b_blue="\[\e[44m\]"
b_purple="\[\e[45m\]"
b_cyan="\[\e[46m\]"
b_white="\[\e[47m\]"

# Reset
reset="\[\e[0m\]"

git_branch="\$(__git_ps1 \"$blue(%s)$reset \")"
current_time='\t'
command_num='\!'
username='\u'
hostname='\h'
path="\$(pwd)"
last_command_success_color='$(if [[ "$?" -eq 0 ]]; then echo -e "\[\e[42m\]\]"; else echo -e "\[\e[101m\]\]"; fi)'
venv_dir='$(if [[ "$VIRTUAL_ENV" ]]; then echo -e "($(basename $VIRTUAL_ENV)) "; fi)'

# Make a fake __git_ps1 in case importing the real one fails. Then import the real one.
__git_ps1() {
    echo -n "git unavailable"
}
source ./.git_prompt.sh

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PS1="$last_command_success_color $reset # $bold$current_time $git_branch$purple$bold$venv_dir$reset$path\n$normal; "
