{ config, lib, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.keyboard.qmk.enable = true;
  
  services.udev.packages = with pkgs; [
    qmk-udev-rules
  ];

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
  ];

  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;
    sensor.iio.enable = true;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "schedutil";
  };

  boot.tmp.cleanOnBoot = true;

  services.thermald.enable = true;
}
