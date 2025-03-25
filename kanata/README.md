# Kanata

This directory houses a configuration file and systemd service for [Kanata](https://github.com/jtroo/kanata), a tool for remapping keyboard keys.

## What's Inside?
- [kanata.kbd](./.config/kanata/kanata.kbd): Kanata configuration.
- [kanata.service](./.config/systemd/user/kanata.service): A systemd service to start kanata at boot on linux.
- [README.md](./README.md): Documentation for this folder (you’re reading it!).

## Features
- [Home Row Mods](https://precondition.github.io/home-row-mods): Adds additional functionality and improves ergonomics by turning the home row keys into modifiers (`⇧ Shift`, `⎈ Control`, `⎇ Alt`, and `⊞ Win`) when held.
- Home Position Numpad Layer: Integrates a numpad layer on the right hand from the home position for enhanced productivity and ergonomics. Hold `caps` for this layer.
- Caps Lock & Escape Swap: Swaps the Caps Lock and Escape keys for improved usability and efficiency.

## Setup
To use these configurations:
1. Clone the dotfiles repository:
    ```bash
    git clone https://github.com/elinskyj/dotfiles.git
    ```
2. Navigate to the `dotfiles` folder:
    ```bash
    cd dotfiles
    ```
3. Copy `kanata.kbd` to your config folder:
    ```bash
    cp kanata.kbd ~/.config/kanata/kanata.kbd
    ```

### Using GNU Stow
GNU Stow is a convenient way to manage dotfiles. To set up Kanata configurations:
1. Clone the dotfiles repository
2. Navigate to the `dotfiles` folder
3. Use Stow to symlink the kanata folder:
    ```bash
    stow -t $HOME kanata
    ```
This will create symbolic links to the Kanata configuration files in the appropriate locations.

### Windows Setup
1. Clone the repository to a convenient directory, such as `C:\dotfiles`.
2. Copy the `kanata.kbd` file to the Kanata configuration folder:
    ```cmd
    copy kanata.kbd %USERPROFILE%\.kanata\kanata.kbd
    ```
3. Use a symbolic link tool like `mklink` if you prefer linking instead of copying:
    ```cmd
    mklink %USERPROFILE%\.kanata\kanata.kbd C:\dotfiles\kanata\kanata.kbd
    ```

### macOS Setup
1. Clone the dotfiles repository:
2. Navigate to the `kanata` folder:
    ```bash
    cd dotfiles/kanata
    ```
3. Copy the `kanata.kbd` file to Kanata's configuration directory:
    ```bash
    cp kanata.kbd ~/Library/Application\ Support/Kanata/kanata.kbd
    ```
4. Use a symbolic link if preferred:
    ```bash
    ln -s ~/dotfiles/kanata/kanata.kbd ~/Library/Application\ Support/Kanata/kanata.kbd
    ```

## See also
- [Kanata Configuration Guide](https://jtroo.github.io/config.html)
- [Kanata simulator](https://jtroo.github.io/)
- [Key Code Event Tool](https://www.toptal.com/developers/keycode)