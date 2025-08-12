#!/usr/bin/bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#################################################################### Bash stuff
HISTCONTROL=ignoreboth:erasedups

####################################################################### Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias nv='nvim'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias arti="cargo run --profile quicktest --all-features -p arti -- "

####################################################################### Exports
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export EDITOR=nvim

######################################################################### $PATH
if [[ $PATH != *"$HOME/.local/bin"* ]]; then
    export PATH=$HOME/.local/bin:$PATH
fi

if [[ $PATH != *"$HOME/.cargo/bin"* ]]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

########################################################################### fzf
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

ignore_dirs=(".git" "node_modules" "target")

walker_skip=$(IFS=','; echo "${ignore_dirs[*]}")

export FZF_DEFAULT_OPTS="
    --multi
    --highlight-line
    --height            50%
    --tmux              80%
    --layout            reverse
    --border            sharp
    --info              inline-right
    --walker-skip       $walker_skip
    --preview           '$HOME/oss/fzf/bin/fzf-preview.sh {}'
    --preview-border    line
    --tabstop           4"
export FZF_CTRL_T_OPTS="
    --walker-skip       $walker_skip
    --preview           'bat -n --color=always {}'
    --bind              'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
    --no-preview"

tree_ignore=$(printf ' -I %s' "${ignore_dirs[@]}")

export FZF_ALT_C_OPTS="
    --walker-skip       $walker_skip
    --preview           'tree -C $tree_ignore --gitignore {}'"
# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS="
    --walker file,dir,follow,hidden"
# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS="
    --walker dir,follow,hidden"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)
            fzf --preview 'tree -C {} | head -200' "$@"
            ;;
        export | unset)
            fzf --preview "eval 'echo \$'{}" "$@"
            ;;
        ssh)
            fzf --preview 'dig {}' "$@"
            ;;
        *)
            fzf --preview 'bat -n --color=always {}' "$@"
            ;;
    esac
}

###################################################################### starship
eval "$(starship init bash)"

########################################################################## tmux
if [[ -z "$TMUX" ]]; then
    tmux new -A
fi

############################################################### Bash completion
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

#################################################################### Git prompt
# Using starship instead
# . /home/playbahn/.git-prompt.sh

# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWSTASHSTATE=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# GIT_PS1_SHOWUPSTREAM="auto"
# GIT_PS1_SHOWCONFLICTSTATE="yes"
# GIT_PS1_STATESEPARATOR=' '
# GIT_PS1_SHOWCOLORHINTS=1

########################################################################## $PS1
PS1='[\u@\h \W]$ '
