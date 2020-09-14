# ZSH Theme - erfan
# a combination of af-magic and macovsky

# af-magic:
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

# macovsky:
# ZSH Theme - Preview: https://i.gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png


# settings
typeset +H return_code="%(?..%{$FG[009]$BG[237]%}%? %{$reset_color%})"
typeset +H my_gray="$FG[239]"
typeset +H my_orange="$FG[214]"


# separator dashes size
function afmagic_dashes {
	[[ -n "${VIRTUAL_ENV-}" && -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" && "$PS1" = \(* ]] \
		&& echo $(( COLUMNS - ${#VIRTUAL_ENV} - 3 )) \
		|| echo $COLUMNS
}

# execution time show
function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}



PROMPT='$my_gray${(l.$(afmagic_dashes)..-.)}%{$reset_color%}'

PROMPT+='%(?.$FG[046].$FG[009])↵%{$reset_color%}\
$FG[103] %*%{$reset_color%} \
%{$FG[039]%}%~%{$reset_color%} $(git_prompt_info)%{$reset_color%}%{$FG[214]%}%B»%b '



# right prompt
RPS1='${return_code}'

(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
RPS1+=' $my_gray%n@%m%{$reset_color%}'

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))'ms'

    # export RPROMPT="%F{cyan}${elapsed}ms %{$reset_color%}"
    unset timer
  fi
}

RPS1+='%F{cyan} ${elapsed}%{$reset_color%}'





# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
