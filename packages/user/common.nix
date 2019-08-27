{ config, pkgs, ... }:
let
  secrets = (import ../../private/secrets.nix);
in
{
  imports =
  [
    # Programs
    ./dotfiles.nix
    ./git.nix
    ./fish.nix
    ./gnupg.nix
    ./chat.nix
  ];
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    gnupg
    pass
    keybase
    android-file-transfer
  ];
}
