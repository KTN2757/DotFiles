source ~/.profile
export HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000
 
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false"
 
plugins=(vi-mode git zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)
 
_comp_options+=(globdots)
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init --cmd cd zsh)"
bindkey -v
unsetopt autocd
 
alias cls="clear"
alias t="tmux"
alias r="ranger"
alias nv="nvim"
alias v="vim"
alias explorer="thunar"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias music="~/.config/ncmpcpp/music_session.sh"
 
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
 
[[ ! -f ${ZDOTDIR:-~}/.p10k.zsh ]] || source ${ZDOTDIR:-~}/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# pywal
source ~/.cache/wal/colors.sh
cat ~/.cache/wal/sequences
 
if [[ $- == *i* ]] && [[ "$TERM_PROGRAM" != "tmux" ]] && [[ "$TMUX" == "" ]]; then
  fastfetch
else
  cls
fi

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
 
# bun completions
[ -s "/home/kritagya-dahal/.bun/_bun" ] && source "/home/kritagya-dahal/.bun/_bun"
 
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
 
# compdump
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
