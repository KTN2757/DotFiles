HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="alanpeabody"
ENABLE_CORRECTION="false"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
eval "$(zoxide init --cmd cd zsh)"

alias cls="clear"
alias explorer="dolphin"

alias ls="ls --color=never"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
unsetopt autocd
current_wallpaper=$(swww query | grep -oP 'image:\s*\K.*')
wal -i $current_wallpaper > /dev/null
fastfetch

export PATH=$PATH:/home/kritagya-dahal/.spicetify
export TERM=xterm-kitty
export EDITOR=nvim
