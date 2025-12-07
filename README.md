# .dotfiles

> "If you can't control your environment, you can't control your code."

My personal configuration for the **Fortress** (Arch Linux x86_64). Optimized for keyboard-driven workflows, minimalism, and reliability.

![Desktop Preview](path/to/screenshot.png)

## The Stack

| Component | Choice |
| :--- | :--- |
| **OS** | Arch Linux |
| **WM** | Hyprland |
| **Terminal** | Kitty |
| **Shell** | Zsh + Starship |
| **Editor** | Neovim (Lua) |
| **Bar** | Waybar |
| **Launcher** | Rofi / Tofi |
| **Notifications** | Mako |

## Structure

* **`hypr/`**: Window rules, keybinds, and animations.
* **`nvim/`**: The brain. LSP, treesitter, and plugins.
* **`waybar/`**: Status modules (Clock, CPU, RAM).
* **`fastfetch/`**: System credential display.

## Installation

Clone the repository:

```bash
git clone [https://github.com/osaigbovo34/dotfiles.git](https://github.com/osaigbovo34/dotfiles.git) ~/dotfiles
```

Link a configuration (Example: Neovim):

- ### Backup existing config first
```bash
mv ~/.config/nvim ~/.config/nvim.bak.$(print -P '%D{%Y-%m-%d}')
```
- ### Create the symlink
```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```
