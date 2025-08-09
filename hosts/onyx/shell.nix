{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "fzf"
        "git"
      ];
    };
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      "ls" = "eza --icons=auto --group-directories-first --color=always";
      "l" = "eza --icons=auto --group-directories-first --color=always -l";
      "ll" = "eza --icons=auto --group-directories-first --color=always -la";
      "tree" = "eza --tree --color=always";
      "diff" = "diff --color=auto";
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.bash = {
    completion.enable = true;
    enableLsColors = true;
    
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      "ls" = "eza --icons=auto --group-directories-first --color=always";
      "l" = "eza --icons=auto --group-directories-first --color=always -l";
      "ll" = "eza --icons=auto --group-directories-first --color=always -la";
      "tree" = "eza --tree --color=always";
      "diff" = "diff --color=auto";
    };
  };

  environment.systemPackages = with pkgs; [
    eza
    fzf
    home-manager
    nix-index
  ];

  programs.pay-respects.enable = true;
}
