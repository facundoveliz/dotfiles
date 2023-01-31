# Add dotfiles

```
git clone --bare https://github.com/facundoveliz/dotfiles $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dots checkout
```

# Install yay

```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

# Fix audio

First try rebooting, if not, try this

# Fix time

Set time to local

```
pulseaudio -D
```

# NVim

## Install packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Tambien proba con:

```
nvim +PackerSync
```

## Install nulljs stuff

```
npm install -g @fsouza/prettierd
cargo install stylua
```

## Install Treesitter and LSP stuff

Use npm/yarn and :TSInstall

# Install oh-my-zsh and its plugins

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

# GTK Themes

The current best theme is materia, but I also used numix

# fstab

Example of code

```
UUID=56CC3A6ECC3A488F           /mnt/1TB   ntfs-1g nofail,noatime,rw,user,uid=1000,gid=1000,dmask=022,fmask=133,windows_names,auto,hide_hid_files, 0 2
```

# DMenu emojis

Remove some lines of code that doesn't let show emojis

```
https://www.codejam.info/2021/08/dmenu-libxft-bgra-emoji-support.html
```

# Autologin

```
sudo vim /etc/systemd/system/getty.target.wants/getty@tty1.service
```

And modify

```
ExecStart=-/sbin/agetty --noclear %I $TERM
```

To this

```
ExecStart=-/sbin/agetty -a USERNAME %I $TERM
```

```
sudo timedatectl set-local-rtc 1 --adjust-system-clock
```

# SSH keys

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# gpg keys

# Export a specific `foo@bar.com` key in an encrypted (i.e. password-protected) file `mykey.sec.asc`

gpg --armor --export-secret-keys foo@bar.com | gpg --armor --symmetric --output mykey.sec.asc

# Import the key in `mykey.sec.asc`. `gpg` will ask for the password used when exporting.

gpg --no-use-agent --output - mykey.sec.asc | gpg --import

## Generate a strong random password using gpg

gpg --armor --gen-random 1 20

# disable fallback

Change PRESETS=('default' 'fallback') line to PRESETS=('default') in all .preset files in /etc/mkinitcpio.d/.

# pass

git clone git@github.com:facundoveliz/password-store.git

move password-store to ~/.password-store

# scripts & userful commands

## dust

see which directories and files are taking the most space

## tealdeer

Simplified and community-driven man pages

## cnf

command-not-found handler which automatically finds and prompts to install the package containing the command

## trans

translate (https://github.com/soimort/translate-shell)

## bottom

htop/btop/gotop replacemente, usage with **btm**

## trickle

bandwith limiter, use with:

```
trickle -d 25 -u 15 firefox
```

## tig

git text-mode interface

## bandwhich

display current network utilization
