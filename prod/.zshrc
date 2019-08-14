HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

export FZF_CTRL_R_OPTS="--reverse --color=fg:#888888,bg:-1,fg+:#FFFFFF,pointer:#01AB84,prompt:#01AB84,header:#01AB84,hl:#01AB84,hl+:#FFFFFF"

setopt append_history share_history histignorealldups
setopt autocd
unsetopt beep
zstyle :compinstall filename '/home/id0827502/.zshrc'
setopt rmstarsilent
autoload -Uz compinit
compinit

# prompt
PROMPT='%F{green}%B[%c]%b%f '
#RPROMPT='%F{magenta}%B[%?]%b%f'

# aliases
alias vim="nvim"
alias ls="ls --color=auto"
alias aws-login="saml2aws login -a"
alias slack2="slack --disable-gpu"
alias history="history -E 0"
alias copy="xclip -selection clipboard"

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ignore case in directory/file auto-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# set title on terminal spawn
precmd () {
    print -Pn "\e]0;%~\a"
}

# set title on command execution
preexec () {
    print -Pn "\e]0;$1\a"
}

# key bindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
