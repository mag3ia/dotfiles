# NixOS Dotfiles Repository

Welcome to my NixOS dotfiles repository! This repository contains configuration files, scripts, and settings that I use to customize my NixOS environment. The primary goal is to maintain a consistent and efficient workflow across my various machines.

## Table of Contents

- [NixOS Dotfiles Repository](#nixos-dotfiles-repository)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Structure](#structure)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

[NixOS](https://nixos.org/) is a unique Linux distribution built on top of the Nix package manager. It provides a highly customizable and reproducible environment, making it an excellent choice for managing dotfiles.

These dotfiles are designed to work specifically with NixOS and include configurations for various tools and applications, such as:

- Window manager: [Hyprland](https://hyprland.org/)
- Terminal emulator: [Tabby](https://tabby.sh/)
- Shell: [zsh](https://www.zsh.org/)
- Text editor: [Neovim](https://neovim.io/)
- And many more!

Feel free to explore, adapt, and use these configurations to suit your needs.

## Prerequisites

Before installing these dotfiles, ensure that you have:

- A running NixOS system
- Git installed on your system

## Installation

To install these dotfiles on your NixOS system, follow these steps:

1. Clone the repository:

``` bash
git clone https://github.com/yourusername/nixos-dotfiles.git ~/.nixos-dotfiles
```

2. Create symlinks to the configuration files in your home directory:

```bash
cd ~/.nixos-dotfiles
./install.sh
```

3. Update your NixOS configuration:

```bash
sudo nixos-rebuild switch
```

4. Reboot your system or restart the necessary services for the changes to take effect.

## Usage

After installing the dotfiles, your environment should now be set up with the provided configurations. Feel free to customize and modify the configurations to suit your preferences.

## Structure

The repository is organized as follows:

- `configs/`: Contains configuration files for various applications and tools.
- `home-manager/`: Contains [Home Manager](https://github.com/nix-community/home-manager) configuration files and modules.
- `nixos/`: Contains NixOS system-level configuration files and modules.
- `scripts/`: Contains utility scripts for installation and other tasks.
- `install.sh`: Installation script for creating symlinks to configuration files.
- `README.md`: This documentation file.

## Contributing

If you have suggestions or improvements, feel free to fork this repository, create a branch with your changes, and submit a pull request. I appreciate any feedback and contributions!

## License

This NixOS dotfiles repository is released under the [MIT License](https://opensource.org/licenses/MIT). See the [LICENSE](LICENSE) file for details.
