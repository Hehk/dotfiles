# OpenCode Context for Chezmoi Dotfiles

## Repository Structure
- This is a dotfiles repository managed with chezmoi
- Contains configuration for: Neovim, tmux, starship, alacritty, aerospace, ghostty

## Neovim Configuration
- Uses lazy.nvim for plugin management
- Formatting: 2-space indentation, expandtab
- LSP setup with lsp-zero.nvim
- Formatters: biome, prettierd, prettier, stylua, cljfmt
- Theme: kanagawa

## Code Style
- Lua: Use local for function definitions
- Indentation: 2 spaces
- Line endings: LF
- Vim global is used directly (ignore undefined-global warnings)
- Keymaps follow vim.keymap.set pattern

## Commands
- Apply dotfiles: `chezmoi apply`
- Edit dotfiles: `chezmoi edit [file]`
- Add file to repo: `chezmoi add [file]`
- Update from source: `chezmoi update`