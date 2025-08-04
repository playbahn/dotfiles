#!/usr/bin/bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias nv='nvim'

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

HISTCONTROL=ignoreboth:erasedups

if [[ $PATH != *"$HOME/.local/bin"* ]]; then
    export PATH=$HOME/.local/bin:$PATH
fi

if [[ $PATH != *"$HOME/.cargo/bin"* ]]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

alias arti="cargo run --profile quicktest --all-features -p arti -- "

export FZF_DEFAULT_OPTS="
    --multi
    --highlight-line
    --height            50%
    --tmux              80%
    --layout            reverse
    --border            sharp
    --info              inline-right
    --preview           '$HOME/oss/fzf/bin/fzf-preview.sh {}'
    --preview-border    line
    --tabstop           4"
export FZF_CTRL_T_OPTS="
    --walker-skip       .git,node_modules,target
    --preview           'bat -n --color=always {}'
    --bind              'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
    --no-preview"
export FZF_ALT_C_OPTS="
    --walker-skip       .git,node_modules,target
    --preview           'tree -C {}'"

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

export EDITOR=nvim

eval "$(starship init bash)"

if [[ -z "$TMUX" ]]; then
    tmux new -A
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# . /home/playbahn/.git-prompt.sh

# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWSTASHSTATE=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# GIT_PS1_SHOWUPSTREAM="auto"
# GIT_PS1_SHOWCONFLICTSTATE="yes"
# GIT_PS1_STATESEPARATOR=' '
# GIT_PS1_SHOWCOLORHINTS=1

PS1='[\u@\h \W]$ '
