{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride { mArch = "GENERIC_V3"; };

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "tcp_bbr" "v4l2loopback" ];
  
  boot.kernelParams = [ "amdgpu.dc=1" ];
  
  services.scx = {
    enable = true;
    scheduler = "scx_rustland";
  };
  
  boot.kernel.sysctl = {
    "vm.max_map_count" = 1048576;
    "fs.inotify.max_user_watches" = 65536;
    "fs.inotify.max_user_instances" = 524288;
    "fs.inotify.max_queued_events" = 16384;
    "vm.swappiness" = 180;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 15;
    "vm.page-cluster" = 0;
  };
  
  zramSwap = {
    enable = true;
    priority = 5;
    memoryPercent = 25;
    algorithm = "zstd";
  };
}
