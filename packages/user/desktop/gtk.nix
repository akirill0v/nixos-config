{ config, pkgs, ... }:
let
  secrets = (import ../../../private/secrets.nix);
in
{
 home-manager.users.${secrets.username} = {
   xsession = {
    enable = true;

    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 38;
    };

    profileExtra =
    ''
      xrdb -merge ~/.extend.Xresources
      bass source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    '';
   };

   gtk = {
     enable = true;
     theme = { name = "Arc-Dark"; package = pkgs.arc-theme; };
     iconTheme = { name = "Paper"; package = pkgs.paper-icon-theme; };
   };

   qt = {
    enable = false;
    platformTheme = "gnome";
   };

   xresources.properties = {
    "Xft.antialias" = 1;
    "Xft.autohint" = 0;
    "Xft.hinting" = 1;
    "Xft.hintstyle" = "hintfull";
    "Xft.lcdfilter" = "lcddefault";
    "Xcursor.theme" = "breeze_cursors";
    "Xcursor.size" = 38;
   };

 };
}
