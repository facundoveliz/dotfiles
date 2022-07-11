#!/usr/bin/sh

case "$1" in
    "gruvbox-dark-hard")
      sed -i 's/colorscheme = ".*"/colorscheme = "gruvbox"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;
    "gruvbox-light-hard")
      sed -i 's/colorscheme = ".*"/colorscheme = "gruvbox"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "light"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "rose-pine")
      sed -i 's/colorscheme = ".*"/colorscheme = "rose-pine"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/dark_variant = ".*"/dark_variant = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;
    "rose-pine-moon")
      sed -i 's/colorscheme = ".*"/colorscheme = "rose-pine"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/dark_variant = ".*"/dark_variant = "moon"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;
    "rose-pine-dawn")
      sed -i 's/colorscheme = ".*"/colorscheme = "rose-pine"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "light"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "nord")
      sed -i 's/colorscheme = ".*"/colorscheme = "nord"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "onedark")
      sed -i 's/colorscheme = ".*"/colorscheme = "onedark"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "solarized-dark")
      sed -i 's/colorscheme = ".*"/colorscheme = "NeoSolarized"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;
    "solarized-light")
      sed -i 's/colorscheme = ".*"/colorscheme = "NeoSolarized"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "light"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "catppuccin")
      sed -i 's/colorscheme = ".*"/colorscheme = "catppuccin"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "everforest")
      sed -i 's/colorscheme = ".*"/colorscheme = "everforest"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "tokyonight")
      sed -i 's/colorscheme = ".*"/colorscheme = "tokyonight"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "ayu-dark")
      sed -i 's/colorscheme = ".*"/colorscheme = "ayu"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.g.ayucolor = ".*"/vim.g.ayucolor = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;
    "ayu-mirage")
      sed -i 's/colorscheme = ".*"/colorscheme = "ayu"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.g.ayucolor = ".*"/vim.g.ayucolor = "mirage"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    "kanagawa")
      sed -i 's/colorscheme = ".*"/colorscheme = "kanagawa"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

     "jellybeans")
      sed -i 's/colorscheme = ".*"/colorscheme = "jellybeans"/g' ~/.config/nvim/lua/user/colorscheme.lua |
      sed -i 's/vim.o.background = ".*"/vim.o.background = "dark"/g' ~/.config/nvim/lua/user/colorscheme.lua ;;

    *)
      notify-send "Nvim Theme Changer" "Theme doesn't exists in NeoVim"
      exit 1
      ;;
esac
