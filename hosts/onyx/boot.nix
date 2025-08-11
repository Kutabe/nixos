{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.kernelPackages = pkgs.linuxPackages_lqx;

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "tcp_bbr" "v4l2loopback" ];
  
  boot.kernelParams = [ "amdgpu.dc=1" ];
  
  boot.kernel.sysctl = {
    "vm.max_map_count" = 1048576;
  };
}
