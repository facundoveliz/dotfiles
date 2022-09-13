# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# ================ plugins ================

autoload -U compinit && compinit -u

plugins=(
    git
    colored-man-pages
    zsh-autosuggestions
    zsh-completions
    history
    alias-tips
    zsh-syntax-highlighting
)

eval "$(zoxide init zsh)"

# ================ exports ================

# zsh
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=7
source $ZSH/oh-my-zsh.sh

# scripts path
export PATH="$HOME/.local/bin:$PATH"

# default apps
export EDITOR="nvim"

# locale
export LANG=en_US.UTF-8

# clipmenu
export CM_DIR="$HOME/.clipboard"
export CM_SELECTIONS="clipboard"

# ================ auto start ================

# auto startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# ================ key bindings ================

bindkey '^H' backward-kill-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# ================ aliases ================

# misc
alias pac='sudo pacman --color=always'
alias open='xdg-open .' # open current location in file manager
alias h='history'
# alias discord='discord --no-sandbox' # fix discord
alias pomotroid='pomotroid --in-process-gpu &'
alias clipboard='xclip -selection clipboard' # copy command output when used on a pipe
alias disks='df -h | grep sd \
  | sed -e "s_/dev/sda[1-9]_\x1b[34m&\x1b[0m_" \
  | sed -e "s_/dev/sd[b-z][1-9]_\x1b[33m&\x1b[0m_" \
  | sed -e "s_[,0-9]*[MG]_\x1b[36m&\x1b[0m_" \
  | sed -e "s_[0-9]*%_\x1b[32m&\x1b[0m_" \
  | sed -e "s_9[0-9]%_\x1b[31m&\x1b[0m_" \
  | sed -e "s_/mnt/[-_A-Za-z0-9]*_\x1b[34;1m&\x1b[0m_"'


# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rmf='rm -rf'

# ls replacement
alias ls='exa --color=auto --group-directories-first'
alias la='exa -ahl --color=always --group-directories-first --sort extension'

# bookmarks
alias dev='cd ~/Documents/Dev'
alias media='cd /mnt/1TB/Media'

# git
alias gc='git clone'
alias gi='git init'
alias ga='git add'
alias gp='git push'
alias gf='git fetch'
alias gs='git status'
alias gl='git log'
alias gaa='git add --all'
alias gpl='git pull'
alias gpu='git push -u origin main'

# ================ functions ================

function gac() {
  git add --all
  git commit -m "$*"
}

# create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# extract compressed
function ext() {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1     ;;
          *.tar.gz)    tar xvzf $1     ;;
          *.bz2)       bunzip2 $1      ;;
          *.rar)       unrar x $1      ;;
          *.gz)        gunzip $1       ;;
          *.tar)       tar xvf $1      ;;
          *.tbz2)      tar xvjf $1     ;;
          *.tgz)       tar xvzf $1     ;;
          *.zip)       unzip $1        ;;
          *.Z)         uncompress $1   ;;
          *.7z)        7z x $1         ;;
          *)           echo "'$1' cannot be extracted via ext()" ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# download any video
function dl() {
  youtube-dl $@ --exec "mv {} ~/Downloads && thunar ~/Downloads/{} && exit && notify-send 'youtube-dl' 'Download finished'"
}

# movie/tv-show torrenting
function torrent() {
  webtorrent "$@" --vlc -o /mnt/1TB/Media -d 6000 -u 700 --on-done "notify-send 'Webtorrent' 'The torrent finished downloading'"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "/home/facu/.ghcup/env" ] && source "/home/facu/.ghcup/env" # ghcup-env
