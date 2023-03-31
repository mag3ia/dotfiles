# Scripts

This `scripts` directory contains a collection of utility scripts and custom commands that help automate tasks, manage dotfiles, and enhance your workflow. These scripts are designed to work with the NixOS dotfiles in this repository.

## Table of Contents

- [Scripts](#scripts)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Scripts Overview](#scripts-overview)
  - [Usage](#usage)

## Introduction

The scripts in this directory serve a variety of purposes, from automating routine tasks to managing the dotfiles themselves. They are designed to be flexible and customizable, allowing you to adapt them to your specific needs and preferences.

## Scripts Overview

Here's a brief overview of the scripts included in this directory:

1. `update.sh`: Updates the dotfiles repository, pulling the latest changes from the remote repository.
2. `bootstrap.sh`: Sets up a new machine or environment by installing necessary packages and tools and configuring the system according to the dotfiles.
3. `backup.sh`: Creates backups of your current configurations and settings before making changes or updates.
4. `system_maintenance.sh`: Automates common system maintenance tasks, such as updating packages, cleaning up temporary files, and running system checks.
5. `launch_app_example.sh`: An example script for launching a specific application with predefined settings or command-line arguments.
6. `git_current_branch.sh`: Displays the current Git branch.
7. `file_size.sh`: Displays the file size of a given file.

## Usage

To use a script, run it from the command line, providing any necessary arguments:

```bash
./script_name.sh [arguments]
```

If you want to make these scripts available system-wide, consider adding the `scripts` directory to your `PATH` environment variable. To do this, add the following line to your shell configuration file (e.g., `~/.zshrc` or `~/.bashrc`):

```bash
export PATH="$HOME/.nixos-dotfiles/scripts:$PATH"
```

After adding the scripts directory to your PATH, you can run the scripts directly from the command line without specifying their location:

```css
script_name.sh [arguments]
```
