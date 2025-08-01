{ config, lib, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;
    sensor.iio.enable = true;
  };

  environment.systemPackages = with pkgs; [
    qmk
    lm_sensors
    hddtemp
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "schedutil";
  
  boot.tmp.cleanOnBoot = true;
  services.thermald.enable = true;
}
