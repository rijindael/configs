#Aliases
alias l='ls'
alias ll='ls -shla'
alias la='ls -la'
alias vpn-oiks='sudo openvpn /home/hugh/vpn/.user.ovpn'
alias vpn-proxy='sudo openvpn /home/hugh/vpn/.user2.ovpn'
## Set up the prompt
#https://github.com/Phantas0s/purification/tree/master
fpath=(/home/hugh/zsh/purification/ $fpath)
autoload -Uz prompt_purification_setup
prompt_purification_setup

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

_comp_options+=(globdots)

#plugins
fpath=(/home/hugh/zsh/zsh-completions/src $fpath)
source /home/hugh/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#scripts
source /home/hugh/zsh/bd/bd.zsh
