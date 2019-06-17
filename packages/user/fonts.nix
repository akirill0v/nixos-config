{ config, pkgs, ... }:
let
  secrets = (import ../../private/secrets.nix);
in
{
  fonts = {
    fontconfig = {
      enable = true;
      antialias = true;
      cache32Bit = true;
      useEmbeddedBitmaps = true;
      ultimate = {
        enable = true;
        substitutions = "combi";
      };
      defaultFonts = {
        monospace = [ "Fira Code" ];
      };
    };

    enableDefaultFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      # nerdfonts
      corefonts
      dejavu_fonts
      fira-code
      fira-code-symbols
      fira-mono
      font-awesome_4
      font-awesome_5
      inconsolata
      liberation_ttf
      noto-fonts
      symbola
      ubuntu_font_family
      unifont
    ];
  };


  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # character map viewer
    gucharmap
  ];
}
