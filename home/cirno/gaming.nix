{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
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
