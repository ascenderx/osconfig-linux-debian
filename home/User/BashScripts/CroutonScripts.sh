#!/usr/bin/env bash
# This file is meant to be sourced from a resource/profile file.

# Set the current distro and desktop environment.
DISTRO="buster"
DESKENV="xfce4"

# Boot Debian distro in CLI mode.
alias GNU="sudo enter-chroot -n $DISTRO"

# Boot Debian distro in native GUI mode.
alias GNUX="sudo start$DESKENV -X xorg"

# Boot Debian distro in XIWI tab on the ChromeOS side.
alias GNUW="sudo start$DESKENV -X xiwi"

# Run an app inside of a new ChromeOS window (requires xiwi installation).
alias XiWi="xiwi $* &> /dev/null &"

# Clean up.
unset DISTRO
unset DESKENV

