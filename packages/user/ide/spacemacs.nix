{ config, pkgs, ... }:

with import <nixpkgs> {};

let
  secrets = (import ../../../private/secrets.nix);
  settings = (import ../../../private/settings.nix);
in
{
  home-manager.users.${secrets.username}.home = {
    packages = with pkgs; [
      emacs
    ];

    file = {
      ".spacemacs" = {
        source = ../../../private/dotfiles/spacemacs;
      };
      # ".emacs.d" = {
      #   source = fetchFromGitHub {
      #     owner = "syl20bnr";
      #     repo = "spacemacs";
      #     rev = "${settings.spacemacs.rev}";
      #     sha256 = "${settings.spacemacs.sha256}";
      #   };
      #   recursive = true;
      # };
    };

  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
}
