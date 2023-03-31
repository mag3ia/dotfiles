# Home Manager Configuration

This `home-manager` directory contains user-level configuration files and modules for use with [Home Manager](https://github.com/nix-community/home-manager). Home Manager is a tool for managing user-specific configurations on NixOS and other Nix-based systems, allowing you to manage and version your user-level environment in a declarative manner.

## Table of Contents

- [Home Manager Configuration](#home-manager-configuration)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Structure](#structure)
  - [Usage](#usage)

## Introduction

The `home-manager` folder is designed to work with Home Manager, a tool for NixOS and other Nix-based systems that helps you manage user-specific configurations. It allows you to define and manage your user environment, including packages, configuration files, and services, in a declarative way using Nix expressions.

## Structure

The `home-manager` folder is organized as follows:

- `home.nix`: The main Home Manager configuration file. This file imports other configuration files and modules and sets user-level options.
- `modules/`: This directory contains custom Home Manager modules that define additional user services, configurations, or packages. You can create and organize modules based on functionality, for example, a module for configuring your shell environment or setting up a specific development environment.

## Usage

To use the configurations in this folder, first ensure that you have Home Manager installed on your system. Follow the [official installation instructions](https://github.com/nix-community/home-manager#installation) to get Home Manager set up.

Next, create a symbolic link to the `home-manager` directory at the user-level configuration location `~/.config/nixpkgs`. This can be done using the `install.sh` script provided in the root directory of the dotfiles repository, or you can manually create the symlink as follows:

```bash
ln -sf ~/.nixos-dotfiles/home-manager ~/.config/nixpkgs
```

After linking the `home-manager` folder, update your user configuration by running:

```bash
home-manager switch
```

This command will apply the changes defined in the configuration files, and you may need to restart services or relog for the changes to take effect.

Remember to customize the configuration files according to your preferences and requirements.
