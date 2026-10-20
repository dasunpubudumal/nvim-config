# My Neovim Config

[Neovim](https://neovim.io/) is my primary text editor. This config is built on [LazyVim](https://www.lazyvim.org/) and
layers my own plugins, keymaps and colorschemes on top. I run it in [Ghostty](https://ghostty.org/) (inside tmux) and,
occasionally, in [Neovide](https://neovide.dev/).

This config is highly opinionated, so it might suit only me :)

## Getting started

The quickest route is: [install Neovim](#installing-neovim), install the [other prerequisites](#prerequisites), then
[set up this config](#setting-up-this-config).

### Installing Neovim

This config needs **Neovim 0.11 or newer** (current LazyVim requires it). Many Linux distribution packages are older
than that, so check the version after installing.

**macOS** ([Homebrew](https://brew.sh/)):

```sh
brew install neovim
```

**Linux** (official release build, works on any distribution):

```sh
# Use nvim-linux-arm64 instead of nvim-linux-x86_64 on ARM machines
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc   # or ~/.zshrc
```

Arch (`sudo pacman -S neovim`) and Fedora (`sudo dnf install neovim`) usually ship a recent enough version. Avoid the
Ubuntu/Debian `apt` package unless `nvim --version` reports 0.11+.

**Windows:**

```powershell
winget install Neovim.Neovim
```

**Check the install:**

```sh
nvim --version   # first line should read NVIM v0.11.x or later
```

See the [official install guide](https://github.com/neovim/neovim/blob/master/INSTALL.md) for other platforms and
package managers.

### Prerequisites

| Tool | Why |
| --- | --- |
| `git` | lazy.nvim clones itself and every plugin |
| A [Nerd Font](https://www.nerdfonts.com/), set as your terminal font | Icons in the statusline, file explorers and pickers |
| [`ripgrep`](https://github.com/BurntSushi/ripgrep) | Telescope `find_files` / `live_grep` |
| [`fd`](https://github.com/sharkdp/fd) | Faster file finding in LazyVim pickers |
| `make` and a C compiler | Builds `telescope-fzf-native` and Treesitter parsers |

Optional, only needed for the plugins that use them:

| Tool | Used by |
| --- | --- |
| [`yazi`](https://yazi-rs.github.io/) | `yazi.nvim` file manager |
| [`gh`](https://cli.github.com/) (authenticated) | `octo.nvim` GitHub issues / PRs |
| [`lazygit`](https://github.com/jesseduffield/lazygit) | LazyVim's `<leader>gg` |
| `tmux` | Seamless pane navigation via `vim-tmux-navigator` |
| Node.js | The LazyVim TypeScript extra |
| [`terraform-ls`](https://github.com/hashicorp/terraform-ls) | Terraform LSP + format-on-save for `*.tf` / `*.tfvars` |
| Rust ≥ 1.65 | Only if `sniprun` needs to compile locally instead of downloading a binary |
| [Neovide](https://neovide.dev/) + Cascadia Code font | GUI client settings in `init.lua` |

On macOS, everything at once:

```sh
xcode-select --install   # make + C compiler, if not already installed
brew install git ripgrep fd lazygit yazi gh tmux node terraform-ls
brew install --cask font-jetbrains-mono-nerd-font
gh auth login
```

On Debian/Ubuntu, the core tools:

```sh
sudo apt install git ripgrep fd-find build-essential unzip curl
```

### Setting up this config

#### 1. Back up any existing config

Neovim reads its config from `~/.config/nvim` (`%LOCALAPPDATA%\nvim` on Windows) and keeps plugins and state in the
other folders below. Move them aside so they don't clash:

```sh
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

Skip any that don't exist.

#### 2. Clone this repo

```sh
git clone https://github.com/dasunpubudumal/nvim-config.git ~/.config/nvim
```

On Windows (PowerShell):

```powershell
git clone https://github.com/dasunpubudumal/nvim-config.git $env:LOCALAPPDATA\nvim
```

#### 3. Launch Neovim and let plugins install

```sh
nvim
```

On first start lazy.nvim bootstraps itself, then installs every plugin at the version pinned in `lazy-lock.json`. This
takes a minute or two. Wait for the install window to finish, quit with `:qa`, and reopen Neovim so everything loads
cleanly. Mason will install language servers in the background the first time you open a file that needs one.

#### 4. Check everything works

- `:checkhealth` reports missing external tools. Fix any errors under `lazyvim` and `telescope` first.
- `:Mason` lets you install or inspect language servers, formatters and linters.
- `:Lazy` shows plugin status. Press `U` to update, `S` to sync.

#### Keeping it up to date

```sh
cd ~/.config/nvim && git pull
```

Then run `:Lazy restore` in Neovim to install the plugin versions recorded in `lazy-lock.json`.

> [!TIP]
> To try the config without touching your own, clone it to `~/.config/nvim-dp` and launch it with
> `NVIM_APPNAME=nvim-dp nvim`. Plugins and state then live in `~/.local/share/nvim-dp` etc., so removing those folders
> undoes everything.

## Layout

```
init.lua                 Entry point: loads lazy.nvim, Neovide settings, misc keymaps, terraform LSP
lazy-lock.json           Pinned plugin versions
lazyvim.json             Enabled LazyVim extras (TypeScript)
lua/config/
  lazy.lua               lazy.nvim bootstrap + LazyVim spec
  options.lua            Editor options
  keymaps.lua            LazyVim keymap overrides
  remap.lua              Leader key and personal remaps
  autocmds.lua           Autocommands (e.g. readable Visual highlight)
lua/plugins/             One file per plugin (or group of plugins)
  disabled.lua           LazyVim defaults and plugins switched off
```

To add a plugin, drop a new file in `lua/plugins/` returning a lazy.nvim spec. To turn one off, see
[Disabling plugins](#disabling-plugins).

## What's included

On top of LazyVim's defaults:

- **Navigation:** Telescope, Harpoon 2, Oil, Yazi, mini.nvim, Outline, vim-tmux-navigator
- **Git:** Diffview, git-blame, Octo (GitHub)
- **Editing:** sniprun (run code snippets), undotree, todo-comments, Trouble, accelerated-jk, hml.nvim, whisk.nvim
- **UI:** lualine, snacks dashboard, headlines, stcursorword, neoscroll, undo-glow, no-neck-pain, toggleterm,
  vellum (Markdown preview)
- **Colorschemes:** many are installed; the active one is [converge](https://github.com/sunnytamang/converge.nvim)
  (catppuccin UI + rose-pine syntax), set in `lua/plugins/colorschemes.lua`. Switch by uncommenting a different
  `vim.cmd.colorscheme(...)` line there.

## Disabling plugins

`lua/plugins/disabled.lua` is the single place for switching plugins off. lazy.nvim merges every spec that refers to
the same plugin, so an entry with `enabled = false` there wins over both LazyVim's defaults and the plugin's own file
in `lua/plugins/`:

```lua
-- lua/plugins/disabled.lua
return {
  { "m4xshen/hardtime.nvim", enabled = false },   -- has its own file, hardtime.lua
  { "bufferline.nvim", enabled = false },         -- a LazyVim default; the plugin's short name also works
  { "sschleemilch/slimline.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
}
```

This lets you keep a plugin's config file around (e.g. `hardtime.lua`, `slimline.lua`) and toggle it with one line.

| Plugin | Disabled in | Notes |
| --- | --- | --- |
| bufferline.nvim | `disabled.lua` | LazyVim default |
| flash.nvim | `disabled.lua` | LazyVim default |
| hardtime.nvim | `disabled.lua` | Config kept in `hardtime.lua` |
| slimline.nvim | `disabled.lua` | Config kept in `slimline.lua`; lualine is the statusline |
| plainline | `plainline.lua` (`enabled = false`) | Alternative statusline |
| smear-cursor.nvim | `smear.lua` (`enabled = false`) | Also skipped in Neovide, which has its own cursor effect |

- **Disable a plugin:** add `{ "author/plugin", enabled = false }` to `disabled.lua` and restart Neovim.
- **Re-enable it:** delete its line from `disabled.lua` and restart; lazy.nvim installs it if it's missing.
- **Free disk space:** disabled plugins stay on disk until you run `:Lazy clean`.
- **Find a LazyVim default's name:** open `:Lazy` and look under the plugin list, or check the
  [LazyVim plugin docs](https://www.lazyvim.org/plugins).

## Keymaps

`<leader>` is <kbd>Space</kbd>. All of LazyVim's [default keymaps](https://www.lazyvim.org/keymaps) apply; these are
the additions and overrides. Press `<leader>` and wait for which-key to see the rest.

| Keys | Mode | Action |
| --- | --- | --- |
| `<leader>ff` / `fg` / `fb` / `fh` | n | Telescope: files / live grep / buffers / help |
| `<Tab>` (in Telescope, normal mode) | n | Jump into the preview window and back |
| `<leader>H` | n | Harpoon: add file |
| `<leader>h` | n | Harpoon: quick menu |
| `<leader>1`–`9` | n | Harpoon: jump to file _n_ |
| `-` | n | Oil: open parent directory |
| `<leader>-` / `<leader>cw` | n | Yazi at current file / at cwd |
| `<C-Up>` | n | Resume last Yazi session |
| `<leader>pv` | n | netrw explorer |
| `<leader>o` | n | Toggle Outline |
| `<leader>u` | n | Toggle undotree |
| `<leader>gv` / `gc` | n | Diffview open / close |
| `<leader>gh` | n | File history (Diffview) |
| `<leader>gB` | n | Review branch changes vs `origin/HEAD` |
| `<leader>oi` / `op` / `od` / `on` / `os` | n | Octo: issues / PRs / discussions / notifications / search |
| `<leader>r` | n, v | Run snippet (sniprun) |
| `<leader>t` | n | Show diagnostic float |
| `<leader>mp` | n | Markdown preview (vellum) |
| `<C-\>` | n | Toggle terminal |
| `<C-h/j/k/l>` | n | Move between splits and tmux panes |
| `J` / `K` | v | Move selection down / up |
| `fo` / `fi` | v | Select outer / inner function (Treesitter) |
| `u` / `U` | n | Undo / redo (with highlight) |

In Neovide, `<C-+>`, `<C-->` and `<C-0>` zoom in, zoom out and reset.

## Formatting Lua

Lua files are formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) (2-space indent, 120 columns, see
`stylua.toml`):

```sh
stylua .
```
