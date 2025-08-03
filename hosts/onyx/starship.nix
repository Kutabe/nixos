{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      continuation_prompt = "[∙](dark-grey) ";
      format = "[╭─\\(](dark-grey)$os$sudo$username@$hostname[\\)─\\($directory$git_branch$git_status\\) $nix_shell$golang](dark-grey)\n[╰─](dark-grey)$character\n";
      palette = "cotton_candy";
      right_format = "$status$cmd_duration$git_metrics$jobs$shlvl\n";

      character = {
        error_symbol = "[❯](pink)";
        success_symbol = "[❯](sky)";
        vimcmd_symbol = "[❮](petal)";
      };

      cmd_duration = {
        format = " [󱎫 ](grey)[$duration](dark-grey)";

        min_time = 1000;
        show_milliseconds = false;
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        style = "fg:sky";

        home_symbol = "🏠";
        read_only = " 🔒";
        read_only_style = "fg:pink";
        truncation_length = 4;
        truncation_symbol = "…/";
        
        substitutions = {
          "/mnt/steam-library" = "steam";
        };
      };

      git_branch = {
        format = " [$symbol$branch(:$remote_branch)]($style)";
        style = "fg:petal";
        symbol = "[󰊢 ](#de4c36)";
        truncation_length = 20;
        truncation_symbol = "…";
      };

      git_commit = {
        format = " [\\($hash$tag\\)]($style)";
        style = "fg:light-grey";

        commit_hash_length = 7;
        only_detached = true;
      };

      git_metrics = {
        format = " [([󰐕$added]($added_style)) ([󰍴$deleted]($deleted_style))]($style)";

        added_style = "fg:green";
        deleted_style = "fg:red";
        disabled = false;
        only_nonzero_diffs = true;
      };

      git_state = {
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        style = "bright-black";

        am = "AM";
        am_or_rebase = "AM/REBASE";
        bisect = "BISECTING";
        cherry_pick = "CHERRY-PICKING";
        merge = "MERGING";
        rebase = "REBASING";
        revert = "REVERTING";
      };

      git_status = {
        format = " [$ahead_behind$all_status]($style)";
        style = "fg:pink";

        ahead = "[\\[+\${count}\\]](green) ";
        behind = "[\\[-\${count}\\]](red) ";

        up_to_date = "[󰗠 ](green)";
        conflicted = "[󰁄 ](red)";
        diverged = "[󰦻 ](yellow)";

        modified = "[󱇧 ](yellow)";
        renamed = "[󰈪 ](yellow)";
        typechanged = "[󰩋 ](yellow)";
        deleted = "[󰩹 ](red)";

        staged = "[󰏓 ](blue)";
        stashed = "[󰪶 ](blue)";

        untracked = "[󰡯 ](yellow)";

        use_git_executable = false;
      };

      golang = {
        format = "[$symbol($version)]($style)";
        style = "fg:white";
        symbol = "[󰟓 ](#00ADD8)";
      };

      nix_shell = {
        format = "[$symbol$state]($style)";
        style = "fg:sky";
        symbol = "󱄅 ";

        impure_msg = "[impure](dark-grey)";
        pure_msg = "[pure](dark-grey)";
        unknown_msg = "[unknown](dark-grey)";
      };

      hostname = {
        format = "[$hostname]($style)";
        style = "fg:petal";

        ssh_only = false;
        ssh_symbol = "󰣀 ";
      };

      jobs = {
        format = " [$symbol](light-grey)[$number](grey)";
        symbol = "󰒓 ";
        number_threshold = 1;
      };

      os = {
        format = "$symbol";

        disabled = false;
        symbols = {
          Linux = "[󰌽 ](white)";
          NixOS = "[󱄅 ](#7EB4DF)";
        };
      };

      sudo = {
        format = "$symbol";
        symbol = "[*](pink)";

        disabled = false;
      };

      status = {
        disabled = false;
        map_symbol = true;
        pipestatus = true;

        pipestatus_format = " [\\[$pipestatus\\]](basalt)[$symbol$common_meaning$signal_name$maybe_int]($style)";
        format = "[$symbol$status]($style)";
        style = "fg:pink";
        pipestatus_separator = "[❯](dark-grey)";

        not_executable_symbol = "[ ](red)";
        not_found_symbol = "[󱞃 ](red)";
        sigint_symbol = "[󰚌 ](red)";
        signal_symbol = "[󱐋 ](red)";
        symbol = "[ ](red)";
      };

      shell = {
        disabled = true;
        format = "[$indicator]($style)";
        style = "fg:blue";
        
        bash_indicator = "󰯮 ";
        fish_indicator = "󰯺 ";
        zsh_indicator = "󰰶 ";
      };

      shlvl = {
        disabled = false;
        format = " [$symbol$shlvl]($style)";
        style = "fg:dark-grey";
        symbol = "[ ](grey)";
      };

      username = {
        disabled = false;
        show_always = true;

        format = "[$user]($style)";
        style_user = "fg:sky";
        style_root = "fg:pink";
      };

      palettes = {
        cotton_candy = {
          white = "#FEFEFE";
          light-grey = "#D3D3D3";
          grey = "#A9A9A9";
          dark-grey = "#696969";

          yellow = "#F7CE63";
          peach = "#F3AA79";
          petal = "#FFC1DA";
          pink = "#FF90BB";
          red = "#FF746A";
          purple = "#937DC0";
          blue = "#5FA3D9";
          sky = "#8ACCD5";
          aqua = "#54BCBB";
          menthol = "#B2F2BB";
          green = "#8DC05A";
        };
      };
    };
  };
}
