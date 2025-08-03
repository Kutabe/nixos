{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rar
    unrar
    zip
    unzip
    p7zip

    bat
    btop
    fastfetch
    file
    tree
    ffmpeg
    
    curl
    dnsutils
    iputils
    mtr
    wget
    
    pciutils
    usbutils
    lshw
    hdparm
    smartmontools
    hwinfo
    
    
    micro
    tealdeer
    timg
    tmux
    
    rsync
    
    age
    sops
  ];
}
