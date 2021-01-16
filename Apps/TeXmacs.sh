#!/usr/bin/env bash

release=$(lsb_release -cs)
sudo echo "deb [arch=amd64] http://ftp.texmacs.org/TeXmacs/tmftp/repos/apt $release universe" > /etc/apt/sources.list.d/texmacs.list
sudo apt update
sudo apt install texmacs

