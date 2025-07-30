{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  networking.hostName = "onyx";
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    allowedUDPPorts = [ ];
    checkReversePath = false; # for VMs
    trustedInterfaces = [ "virbr0" ];
  };

  networking.nat = {
    enable = true;
    internalInterfaces = ["virbr0"];
    externalInterface = "enp7s0";
  };

  boot.kernel.sysctl = {
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "fq";

    "net.ipv4.tcp_rmem" = "4096 8388608 1073741824";
    "net.ipv4.tcp_wmem" = "4096 8388608 1073741824";
    "net.core.rmem_max" = 1073741824;
    "net.core.wmem_max" = 1073741824;
    
    "net.ipv4.tcp_fastopen" = 3;
    
    "net.core.netdev_max_backlog" = 5000;

    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  # ipv4 > ipv6
  environment.etc."gai.conf".text = ''
    # Prefer IPv4 over IPv6
    precedence ::ffff:0:0/96 100
  '';
}
