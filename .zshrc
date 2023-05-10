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
    colored-man-pages
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

eval "$(zoxide init zsh)"

# ================ exports ================

# paths
export PATH=$PATH":$HOME/.local/bin"

# oh-my-zsh
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
export CM_SELECTIONS="clipboard"
export CM_MAX_CLIPS="50"

# fix npm-packages sudo install
NPM_GLOBAL="${HOME}/.npm-global"
export PATH="$PATH:$NPM_GLOBAL/bin"

# preserve manpath if you already defined it somewhere in your config.
# otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_GLOBAL/share/man"

# detaspace
export PATH="/home/facundo/.detaspace/bin:$PATH"

# spotify adblock
export spotify="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"

# pipewire sound crackling fix
export PULSE_LATENCY_MSEC=60 set

# ================ auto start ================

# auto startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# ================ keybindings ================

bindkey '^H' backward-kill-word

# ================ aliases ================

# misc
alias vim='nvim'
alias pac='sudo pacman --color=always'
alias h='history'
alias clipboard='xclip -selection clipboard' # copy command output when used on a pipe
alias tmp='cd $(mktemp -d)' # create temporal folder and cd into it
alias please='sudo $(history -p !!)'
alias lg='lazygit'
alias update='sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm'

# listen mic
alias lm='pactl load-module module-loopback latency_msec=1'
alias lms="pactl unload-module $(pactl list short modules | awk '$2 =="module-loopback" { print $1 }' - )"

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# verbose
alias rm='rm -v'
alias rmf='rm -rfI'
alias cp='cp -vi'
alias mv='mv -vi'

# ls replacement
alias ls='exa --color=auto --group-directories-first'
alias la='exa -ahl --color=always --group-directories-first --sort extension'

alias discord='LIBVA_DRIVER_NAME=radeonsi discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy'

# ================ functions ================

# create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# compress and encrypt with tar and gpg
function gcrypt() {
  tar -cvz $@ | gpg -e -r facundoveliz9@gmail.com -o $@.tgz.gpg
}

# decrypt and exctract with gpg and tar
function gdecrypt() {
  gpg -d $@ | tar xvz
}

# attach to the first existing tmux session, or create a new session if there are none
function tm() {
	if (tmux list-sessions >& /dev/null) then
		tmux a
	else
		tmux
	fi
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
  yt-dlp $@ --exec "mv {} ~/Downloads && thunar ~/Downloads && exit && notify-send 'yt-dlp' 'Download finished'"
}

# movie/tv-show torrenting
function torrent() {
  webtorrent "$@" -o /mnt/1TB/Media -d 6000 -u 700 --on-done "notify-send 'Webtorrent' 'The torrent finished downloading'"
}

# Loads FZF keybindings, replacing native reverse search etc with FZF
[[ -e "/usr/share/fzf/key-bindings.zsh" ]] \
  && source "/usr/share/fzf/key-bindings.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
