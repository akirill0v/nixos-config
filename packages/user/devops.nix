{ config, pkgs, ... }:

{ environment.systemPackages = with pkgs; [
    click
    kubectl
    kubectx
    kubernetes-helm
  ];
}
