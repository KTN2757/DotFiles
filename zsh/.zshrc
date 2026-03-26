HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000

export ZSH="$HOME/.oh-my-zsh"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export EDITOR='nvim'
export VISUAL='nvim'
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
alias music="~/.config/ncmpcpp/music_session.sh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
unsetopt autocd
current_wallpaper=$(awww query 2>/dev/null | grep -oP 'image:\s*\K.*')
[[ -n "$current_wallpaper" ]] && wal -i "$current_wallpaper" > /dev/null 2>&1
if [[ $- == *i* ]] && [[ "$TERM_PROGRAM" != "tmux" ]] && [[ "$TMUX" == "" ]]; then
  fastfetch
fi
if [[ -n "$TMUX" ]] && [[ $- == *i* ]]; then
  export QT_QPA_PLATFORM=wayland
    export WAYLAND_DISPLAY=wayland-1
    export XDG_RUNTIME_DIR=/run/user/1000
  cls
fi

# gtk
export GTK_THEME=oomox-xresources-reverse

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

# opencode
export PATH=/home/kritagya-dahal/.opencode/bin:$PATH
