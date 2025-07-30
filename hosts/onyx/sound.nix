{ config, lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    
    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.rate = 48000;
        default.clock.quantum = 32;
        default.clock.min-quantum = 32;
        default.clock.max-quantum = 512;
      };
    };
  };

  services.pulseaudio.enable = false;
  
  security.rtkit.enable = true;
  
  environment.systemPackages = with pkgs; [
    qpwgraph
    helvum
    pavucontrol
    pwvucontrol
  ];
}
