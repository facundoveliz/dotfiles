# General notes

These are my general notes that I take for a better linux installation through time, and an attempt to make things easier.

# Common fixes

## Audio

Set time to local

```
pulseaudio -D
```

# Packages and utils

## Yay

Package manager

```
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

## Neovim

### Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Tambien proba con:

```
nvim +PackerSync
```

### Nulljs

```
npm install -g @fsouza/prettierd
cargo install stylua
```

### Treesitter

Use npm/yarn and :TSInstall

## oh-my-zsh and its plugins

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

```
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
```

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## GTK Themes

The current best theme is materia, but I also used numix

# Configs

## Faster hibernate

.xinitrc

```
until i3; do
  sleep 1
done
```

Then create an sleep hook called 'hibernate.service'

```
[Unit]
Description=Hibernate hook
Before=hibernate.target
StopWhenUnneeded=yes

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=notify-send testing ; pkill -f i3 ; sync; echo 3. > /proc/sys/vm/drop_caches

[Install]
WantedBy=hibernate.target
```

And enable it with `sudo systemctl enable hibernate`

## fstab

Example of code

```
UUID=56CC3A6ECC3A488F           /mnt/1TB   ntfs-1g nofail,noatime,rw,user,uid=1000,gid=1000,dmask=022,fmask=133,windows_names,auto,hide_hid_files, 0 2
```

## DMenu emojis

Remove some lines of code that doesn't let show emojis

```
https://www.codejam.info/2021/08/dmenu-libxft-bgra-emoji-support.html
```

## Autologin

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

## Enable printer

Download printer driver from [here](https://www.bchemnet.com/suldr/suld.html).

Install `cups`, `cups-pdf` and `usbutils` packages

Enable and start `cups.service`

Enter `localhost:631` and config the printer there.

## Disable kernel fallback

This works well for getting more space in the `efi` partition.

Change `PRESETS=('default' 'fallback')` line to `PRESETS=('default')` in all .preset files in `/etc/mkinitcpio.d/`

## pass

```
git clone git@github.com:facundoveliz/password-store.git
```

And store the folder in `~/.password-store`

# Keys

## SSH keys

[Github guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) in how to add a new one.

## GPG keys

Export a specific `foo@bar.com` key in an encrypted (i.e. password-protected) file `mykey.sec.asc`

```
gpg --armor --export-secret-keys foo@bar.com | gpg --armor --symmetric --output mykey.sec.asc
```

Import the key in `mykey.sec.asc`. `gpg` will ask for the password used when exporting.

```
gpg --no-use-agent --output - mykey.sec.asc | gpg --import
```

### Generate a strong random password using gpg

```
gpg --armor --gen-random 1 20
```
