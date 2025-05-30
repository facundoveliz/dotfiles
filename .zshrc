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

# theme
# export GTK_THEME=Adwaita:dark
export QT_QPA_PLATFORMTHEME=qt5ct
# export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
# export QT_STYLE_OVERRIDE=Adwaita-Dark

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

# rocm setup
export ROCM_PATH=/opt/rocm
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# pyenv setup
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# xdg-desktop-portal setup
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=i3
export GTK_THEME=Breeze-Dark
# export QT_STYLE_OVERRIDE=Adwaita-Dark
# export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct


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
alias print-changes='git --no-pager diff --staged'
alias update='sudo pacman -Syyu && paru -Syyu'
alias maintenance='sudo reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist; sudo pacman -Syu; sudo pacman -Qtdq | sudo pacman -Rns -; sudo pacman -Scc && paru -Syyu' # get fastest mirrors, upgrade packages, remove orphans, clear cache

alias paru='paru --skipreview'

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

alias anki='QTWEBENGINE_CHROMIUM_FLAGS='--disable-gpu' anki'

# pinentry use gtk3
# alias pinentry=pinentry-gnome3

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
  webtorrent "$@" -o /mnt/1TB/Media --on-done "notify-send 'Webtorrent' 'The torrent finished downloading'"
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

# throttle bandwidth
addThrottle() {
    local kbs="kbps"
    echo $kbs
    echo "About to throttle to $1 $kbs"
    echo "sudo tc qdisc add dev enp6s0 handle 1: root htb default 11"
    echo "sudo tc class add dev enp6s0 parent 1: classid 1:1 htb rate $1$kbs"
    echo "sudo tc class add dev enp6s0 parent 1:1 classid 1:11 htb rate $1$kbs"
    sudo tc qdisc add dev enp6s0 handle 1: root htb default 11
    sudo tc class add dev enp6s0 parent 1: classid 1:1 htb rate $1$kbs
    sudo tc class add dev enp6s0 parent 1:1 classid 1:11 htb rate $1$kbs
}

removeThrottle() {
    sudo tc qdisc del dev enp6s0 root
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

# ssh-agent
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/servarica

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/fveliz/.lmstudio/bin"
