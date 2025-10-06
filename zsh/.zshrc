HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh
eval "$(zoxide init --cmd cd zsh)"
bindkey -v

alias cls="clear"
alias t="tmux"
alias r="ranger"
alias nv="nvim"
alias v="vim"
alias explorer="thunar"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
unsetopt autocd
current_wallpaper=$(swww query | grep -oP 'image:\s*\K.*')
wal -i $current_wallpaper > /dev/null
if [[ $- == *i* ]] && [[ "$TERM_PROGRAM" != "tmux" ]] && [[ "$TMUX" == "" ]]; then
  fastfetch
fi
if [[ -n "$TMUX" ]] && [[ $- == *i* ]]; then
  export QT_QPA_PLATFORM=wayland
    export WAYLAND_DISPLAY=wayland-1
    export XDG_RUNTIME_DIR=/run/user/1000
  cls
fi


# pnpm
export PNPM_HOME="/home/kritagya-dahal/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun completions
[ -s "/home/kritagya-dahal/.bun/_bun" ] && source "/home/kritagya-dahal/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
