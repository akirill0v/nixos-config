{ config, pkgs, ... }:

{
  services.samba = {
    enable = true;
    package = pkgs.sambaFull;
    securityType = "user";
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user
      #use sendfile = yes
      #max protocol = smb2
      hosts allow = 192.168.88.0/255.255.255.0 localhost
      guest account = nobody
'';
    shares = {
      private = {
        path = "/work/share";
        browseable = "yes";
        "read only" = "yes";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "alex";
        "force group" = "users";
      };
    };

  };

  environment.systemPackages = with pkgs; [
    # Samba & Cifs
    smbclient
    cifs-utils
  ];
}
