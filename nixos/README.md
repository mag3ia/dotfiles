# NixOS Configuration

This `nixos` directory contains system-level configuration files and modules for NixOS. The configurations in this folder define the setup of your NixOS system, including hardware, software, services, and other system-level settings.

## Table of Contents

- [NixOS Configuration](#nixos-configuration)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Structure](#structure)
  - [Usage](#usage)

## Introduction

The `nixos` folder is designed to work with the NixOS Linux distribution. It contains Nix expressions that describe the desired state of your system. These files are used by NixOS to build, configure, and manage your system in a reproducible and declarative manner.

## Structure

The `nixos` folder is organized as follows:

- `configuration.nix`: The main NixOS configuration file. This file imports other configuration files and modules, and it sets system-level options.
- `hardware-configuration.nix`: This file is generated by NixOS when you install the system. It contains hardware-specific settings, such as file system mounts and kernel modules. You generally should not modify this file manually.
- `flake.nix` file is an essential part of this NixOS configuration, as it allows you to manage dependencies and outputs in a more structured and reproducible way. Flakes are a feature introduced in Nix 2.4, providing a composable and consistent way to manage Nix projects. In this repository, the flake.nix file defines the inputs, such as the NixOS channels and external modules (e.g., nixos-hyprland), and outputs, like the NixOS configurations, that depend on those inputs. By using flakes, you can easily share and reuse configurations across different systems, ensuring a consistent setup across your devices. Make sure you have Nix 2.4 or later installed, as well as the necessary experimental features enabled, to take advantage of the full functionality provided by the flake.nix file.
- `modules/`: This directory contains custom NixOS modules that define additional system services, configurations, or packages. You can create and organize modules based on functionality, for example, a module for configuring the desktop environment or setting up a web server.

## Usage

To use the configurations in this folder, create a symbolic link to the `nixos` directory at the system-level configuration location `/etc/nixos`. This can be done using the `install.sh` script provided in the root directory of the dotfiles repository, or you can manually create the symlink as follows:

```bash
sudo ln -sf ~/.nixos-dotfiles/nixos /etc/nixos
```

After linking the `nixos` folder, update your NixOS system configuration by running:

```bash
sudo nixos-rebuild switch
```

This command will apply the changes defined in the configuration files, and you may need to reboot your system or restart services for the changes to take effect.

Remember to customize the configuration files according to your hardware, preferences, and requirements.