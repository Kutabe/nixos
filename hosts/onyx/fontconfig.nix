{ config, lib, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-color-emoji
      noto-fonts-extra
      nerd-fonts.noto
    ];

    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "full";
      };
      subpixel = {
        rgba = "rgb";
      };
      defaultFonts = {
        serif = [ "Noto Serif" "Noto Serif CJK SC" "Noto Serif CJK TC" "Noto Serif CJK JP" "Noto Serif CJK KR" ];
        sansSerif = [ "Noto Sans" "Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Sans CJK JP" "Noto Sans CJK KR" ];
        monospace = [ "NotoMono Nerd Font" "Noto Sans Mono CJK SC" "Noto Sans Mono CJK TC" "Noto Sans Mono CJK JP" "Noto Sans Mono CJK KR" ];
        emoji = [ "Noto Color Emoji" "Noto Emoji" ];
      };
      localConf = ''
        <fontconfig>
          <alias binding="same">
            <family>Arial</family>
            <prefer>
              <family>Noto Sans</family>
            </prefer>
          </alias>
          <alias binding="same">
            <family>Helvetica</family>
            <prefer>
              <family>Noto Sans</family>
            </prefer>
          </alias>
          <alias binding="same">
            <family>Times</family>
            <prefer>
              <family>Noto Serif</family>
            </prefer>
          </alias>
          <alias binding="same">
            <family>Times New Roman</family>
            <prefer>
              <family>Noto Serif</family>
            </prefer>
          </alias>
        </fontconfig>
      '';
    };
  };
}
