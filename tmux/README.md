# TMUX

This repository contains a custom `.tmux.conf` designed to enhance your workflow with improved key bindings, mouse support, plugins for extended functionality, and aesthetic improvements via Catppuccin themes.

## What is TMUX?

TMUX (Terminal Multiplexer) is a powerful command-line tool that allows users to manage multiple terminal sessions within a single window. It provides features like window splitting, session management, and plugin extensibility, making it a favorite among developers and system administrators for multitasking and boosting productivity.

With TMUX, you can detach from a session and resume it later, even after disconnecting from the terminal, ensuring uninterrupted workflows.

## Features

1. **Custom Key Bindings**: 
   - The default prefix key is set to `Ctrl + s` for increased ergonomics.
   - Navigation between panes is streamlined with `h`, `j`, `k`, and `l` bindings.

2. **Mouse Support**: 
   - Mouse mode is enabled, allowing you to select panes, resize them, and scroll.

3. **Vi-style Key Bindings**: 
   - The `vi` mode is enabled for pane switching, offering a familiar interface for users accustomed to Vim.

4. **Status Bar**:
   - Positioned at the top for better visibility.
   - Styled with Catppuccin's "rounded" window status theme.
   - Displays application and session information using Catppuccin variables.

5. **Plugins**:
   - [`tmux-plugins/tpm`](https://github.com/tmux-plugins/tpm): TMUX Plugin Manager for managing extensions.
   - [`christoomey/vim-tmux-navigator`](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between Vim and TMUX panes.
   - [`catppuccin/tmux#v2.1.0`](https://github.com/catppuccin/tmux): A visually appealing theme for TMUX.

6. **Terminal Configuration**:
   - Default terminal set to `tmux-256color` for optimal color rendering.
   - Overrides added for enhanced RGB color support in `xterm-256color`.

## Usage

- **Reload Configuration**:
  - Press `Ctrl + s` + `r` to reload the configuration file after any changes.

- **Navigate Panes**:
  - Use `Ctrl + s` + `h`, `j`, `k`, and `l` to move left, down, up, and right between panes.

- **Install Plugins**:
  - Press `Ctrl + s` + `I` to install plugins using the TMUX Plugin Manager.

## Additional Notes

- Ensure your terminal emulator supports `tmux-256color` for optimal color rendering.
- Customize plugin settings or themes further by editing the `.tmux.conf` file.
