{ config, pkgs, ... }:

{
  systemd.oomd = {
    enable = true;
    enableRootSlice = true;
    enableUserSlices = true;
  };
  
  systemd.slices."user-".sliceConfig = {
    ManagedOOMMemoryPressure = "kill";
    ManagedOOMMemoryPressureLimit = "85%";
    ManagedOOMSwap = "kill";
  };

  systemd.slices."system-".sliceConfig = {
    ManagedOOMMemoryPressure = "kill";
    ManagedOOMMemoryPressureLimit = "90%";
    ManagedOOMSwap = "kill";
  };
}