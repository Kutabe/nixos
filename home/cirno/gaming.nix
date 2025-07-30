{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    wineWowPackages.stable
    winetricks
    protontricks
    protonup-ng
    protonup-rs
    
    mangojuice
    goverlay
  ];

  # home.file.".config/MangoHud/MangoHud.conf".text = ''
  # '';
}
