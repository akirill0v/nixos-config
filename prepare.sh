#!/usr/bin/env bash

nix-channel --list

nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
nix-channel --update
