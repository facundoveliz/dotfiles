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
export PATH=$PATH":$HOME/.cargo/bin"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=7
source $ZSH/oh-my-zsh.sh

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

# fix java fonts
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# ================ auto start ================

# auto startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# ================ keybindings ================

bindkey '^H' backward-kill-word

# ================ aliases ================

# misc
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

# cat replacement
alias cat='bat'

alias discord='LIBVA_DRIVER_NAME=radeonsi discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy'

# ================ keybinds ================
bindkey -s "^k" 'zi\n'

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

function dl-music() {
  yt-dlp $@ -x --audio-format flac --exec "mv {} /mnt/1TB/Music/misc && notify-send 'yt-dlp' 'Download finished and moved to Music folder'"
}

# movie/tv-show torrenting
function torrent() {
  webtorrent "$@" -o /mnt/1TB/Media -d 6000 -u 700 --on-done "notify-send 'Webtorrent' 'The torrent finished downloading'"
}

# nodemon for java
function watchjava() {
  local main_class="$1"
  find . -name "*.java" | grep -v "/target/" | entr -r bash -c "mvn compile exec:java -Dexec.mainClass='$main_class' | grep -v '^\[INFO\]'"
}

function watchspring() {
  find . -name "*.java" | grep -v "/target/" | entr -r mvn spring-boot:run
}

function fzf-cd-incl-hidden() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
  ls
}

# Loads FZF keybindings, replacing native reverse search etc with FZF
[[ -e "/usr/share/fzf/key-bindings.zsh" ]] \
  && source "/usr/share/fzf/key-bindings.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/facundo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/facundo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/facundo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/facundo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

# bun completions
[ -s "/home/facundo/.bun/_bun" ] && source "/home/facundo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
