{ config, pkgs, ... }:

{
  systemd.oomd = {
    enable = true;
    enableRootSlice = true;
    enableUserSlices = true;
  };
  
  systemd.slices."user-".sliceConfig = {
    ManagedOOMMemoryPressure = "kill";
    ManagedOOMSwap = "kill";
  };

  systemd.slices."system-".sliceConfig = {
    ManagedOOMMemoryPressure = "kill";
    ManagedOOMSwap = "kill";
  };
}