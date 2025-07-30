{ config, lib, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  users.users.cirno = {
    isNormalUser = true;
    description = "Cirno";
    extraGroups = [
      "wheel"
      "audio"
      "pipewire"
      "video"
      "input"
      "render"
      "networkmanager"
      "flatpak"
      "qemu"
      "kvm"
      "libvirtd"
      "gamemode"
      "qemu-libvirtd"
    ];
    
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
