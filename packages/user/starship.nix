{ config, pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
  unstable = import <nixos-unstable> {};
in
{
  home-manager.users.${secrets.username}.programs.starship = {
    enable = true;
    package = unstable.starship;
    settings = {
      # Main config
      add_newline = true;
      # Modules
      aws = {
        disabled = true;
      };
      kubernetes = {
        disabled = false;
        style = "bold blue";
      };
      battery = {
        disabled = false;
        display = {
          threshold = 10;
          style = "bold red";
        };
      };
      dotnet = {
        disabled = true;
      };
      git_commit = {
        disabled = false;
      };
      hostname = {
        ssh_only = false;
      };
      memory_usage = {
        show_percentage = true;
        show_swap = true;
        threshold = -1;
      };
      username = {
        show_always = true;
      };
    };
  };
}
