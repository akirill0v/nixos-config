{ config, pkgs, ...}:

let
  dotfiles = pkgs.stdenv.mkDerivation {
    name = "kirillov-dotfiles";
    srcs = [
      ./dotfiles
    ];

    installPhase = ''
      mkdir -p $out
      cp ./* $out/
    '';
  };
in {
  environment.etc = {
    "alacritty.yml".source    = "${dotfiles}/alacritty.yml";
  };
}
