#!/usr/bin/env bash
# This file is meant to be sourced from a resource/profile file.

# Set Lynx homepage to DuckDuckGo Lite.
export WWW_HOME="https://ddg.gg/lite"

# Check the battery in CLI mode.
alias Battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -B1 percentage"

