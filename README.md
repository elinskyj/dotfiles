# My Dotfiles

This repository contains my personal dotfiles for configuring various applications and environments. Using these dotfiles, you can quickly set up a new machine with my preferred configurations.
<div align="center">
  <img alt="tmux screenshot" src="./assets/tmux.png" width="960px" />
</div>

## Prerequisites

To use these dotfiles, you need to have the following installed on your machine:

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Getting Started

### Clone the Repository

First, clone this repository to your home directory:

```bash
git clone https://github.com/elinskyj/dotfiles.git ~/dotfiles
```

### Backup Existing Dotfiles

Before applying the new dotfiles, it's a good idea to backup your existing dotfiles. You can move them to a backup directory:

```bash
mkdir -p ~/dotfiles_backup
mv ~/.zshrc ~/dotfiles_backup/
```

### Using GNU Stow

GNU Stow is a symlink manager that simplifies the management of dotfiles. It allows you to create symbolic links from this repository to your home directory, so you can easily manage and update your configurations.

#### Install GNU Stow

If you don't have GNU Stow installed, you can install it using your package manager:

- **For macOS (using Homebrew):**

    ```bash
    brew install stow
    ```

- **For Debian-based systems (e.g., Ubuntu):**

    ```bash
    sudo apt install stow
    ```

- **For Red Hat-based systems (e.g., Fedora):**

    ```bash
    sudo dnf install stow
    ```

### Apply Dotfiles

Navigate to the dotfiles repository and use GNU Stow to apply the configurations. For example, to apply the zsh configuration:

```bash
cd ~/dotfiles
stow -t $HOME zsh
```

This command creates symbolic links for the zsh configuration files in your home directory. Repeat this step for other configurations (e.g., `neovim`, `kitty`, etc.):

```bash
stow -t $HOME nvim
stow -t $HOME kitty
```

## Customization

Feel free to customize the dotfiles in the repository to suit your preferences. Since Stow uses symlinks, any changes made to the repository files are instantly reflected in the linked locations

## Unstowing Dotfiles

If you need to remove the symbolic links created by GNU Stow, you can "unstow" them:

```bash
cd ~/dotfiles
stow -D -t $HOME zsh
stow -D -t $HOME nvim
stow -D -t $HOME kitty
```

This will remove the symbolic links, allowing you to revert to your previous configurations.

## Contributing

If you have any improvements or suggestions, feel free to open a pull request or issue on GitHub.
