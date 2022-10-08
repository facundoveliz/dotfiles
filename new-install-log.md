# add dotfiles

```
git clone --bare https://github.com/facundoveliz/dotfiles $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dots checkout
```

# install yay

```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

# fix audio

First try rebooting, if not, try this

```
pulseaudio -D
```

# install neovim

## install packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Tambien proba con:

```
nvim +PackerSync
```

## install nulljs stuff

```
npm install -g @fsouza/prettierd
cargo install stylua
```

## install Treesitter and LSP stuff

Use npm/yarn and :TSInstall

# install oh-my-zsh and its plugins

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

# installing gtk themes

## solarized

```
git clone https://github.com/Ferdi265/numix-solarized-gtk-theme.git
sudo make THEME=SolarizedDarkViolet install
```

# fstab

Example of code

```
UUID=56CC3A6ECC3A488F           /mnt/1TB   ntfs-1g nofail,noatime,rw,user,uid=1000,gid=1000,dmask=022,fmask=133,windows_names,auto,hide_hid_files, 0 2
```

# dmenu emojis

Remove some lines of code that doesn't let show emojis

```
https://www.codejam.info/2021/08/dmenu-libxft-bgra-emoji-support.html
```

# autologin

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

# time

Set time to local

```
sudo timedatectl set-local-rtc 1 --adjust-system-clock
```

# gpg keys

## import

gpg --import ~/secret-backup.gpg

## export

gpg --armor --export-secret-keys facundoveliz9@gmail.com | gpg --armor --symmetric --output mykey.sec.asc

## generate a strong random password

gpg --armor --gen-random 1 20

# scripts & userful commands

## ncdu

see which directories and files are taking the most space

## tldr

Simplified and community-driven man pages
