echo '                 _                 _                               /\_/\ '
echo '  ___  _ _ __ __(_)  __ __ __ ___ | | __  ___  _ __   ___     ____/ o o \'
echo ' / -_)|   \\\\ V /| |  \ V  V // -_)| |/ _|/ _ \|    \ / -_)  /~____  =ø= /'
echo ' \___||_|\_|\_/ |_|   \_/\_/ \___||_|\__|\___/|_|_|_|\___| (______)__m_m)'
echo ' ENVI - Mario Uriarte - Arch Linux'
echo ''

PROMPT='%{$fg[magenta]%}[%c] $(git_prompt_info)$(hg_prompt_info)%{$reset_color%}  '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"

ZSH_THEME_HG_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}["
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN=""




 
