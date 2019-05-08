{ config, pkgs, lib, ... }:
let
  settings = (import ../../../../private/settings.nix);
  secrets = (import ../../../../private/secrets.nix);
in
{
 home-manager.users.${secrets.username} = {
  programs.alacritty = {
    enable = true;
  };
 };
}
