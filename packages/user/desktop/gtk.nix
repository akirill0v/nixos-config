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
      size = 48;
    };
   };

   gtk = {
     enable = true;
     theme = { name = "Arc-Dark"; package = pkgs.arc-theme; };
     iconTheme = { name = "Paper"; package = pkgs.paper-icon-theme; };
   };
 };
}
