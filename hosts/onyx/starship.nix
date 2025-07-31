{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      continuation_prompt = "[∙](basalt) ";
      format = "[╭─\\(](basalt)$os$sudo$username@$hostname[\\)─\\($directory$git_branch$git_status\\) $nix_shell$golang](basalt)\n[╰─](basalt)$character\n";
      palette = "cotton_candy";
      right_format = "$cmd_duration $jobs$status$git_metrics\n";

      character = {
        error_symbol = "[❯](pink)";
        success_symbol = "[❯](sky)";
        vimcmd_symbol = "[❮](petal)";
      };

      cmd_duration = {
        format = " [󱎫 $duration]($style)";
        style = "fg:basalt";

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
        symbol = " ";
        truncation_length = 20;
        truncation_symbol = "…";
      };

      git_commit = {
        format = " [\\($hash$tag\\)]($style)";
        style = "fg:basalt";

        commit_hash_length = 7;
        only_detached = true;
      };

      git_metrics = {
        format = " [([󰐕$added]($added_style)) ([󰍴$deleted]($deleted_style))]($style)";

        added_style = "fg:sky";
        deleted_style = "fg:pink";
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

        ahead = "[\\[+\${count}\\]](mint) ";
        behind = "[\\[-\${count}\\]](petal) ";
        up_to_date = "󰗠 ";

        conflicted = "󰁄 ";
        diverged = "󰦻 ";

        modified = "󱇧 ";
        renamed = "󰈪 ";
        typechanged = "󰩋 ";
        deleted = "󰩹 ";

        staged = "󰏓 ";
        stashed = "󰪶 ";

        untracked = "󰡯 ";

        use_git_executable = false;
      };

      golang = {
        format = "[$symbol($version)]($style)";
        style = "fg:sky";
        symbol = "󰟓 ";
      };

      nix_shell = {
        format = "[$symbol$state]($style)";
        style = "fg:sky";
        symbol = "󱄅 ";

        impure_msg = "[impure](dimmed)";
        pure_msg = "[pure](dimmed)";
        unknown_msg = "[unknown](dimmed)";
      };

      hostname = {
        format = "[$hostname]($style)";
        style = "fg:petal";

        ssh_only = false;
        ssh_symbol = "󰣀 ";
      };

      jobs = {
        format = "[$symbol$number]($style)";
        style = "fg:basalt";
        symbol = "󰒓 ";

        number_threshold = 1;
      };

      os = {
        format = "[$symbol](sky)";

        disabled = false;
        symbols = {
          Linux = "󰌽 ";
          NixOS = "󱄅 ";
        };
      };

      sudo = {
        format = "[$symbol]($style)";
        style = "fg:pink";
        symbol = "*";

        disabled = false;
      };

      status = {
        disabled = false;
        map_symbol = true;
        pipestatus = true;

        pipestatus_format = "[[$pipestatus] ](basalt) [$symbol$common_meaning$signal_name$maybe_int]($style)";
        format = "[$symbol$status]($style)";
        style = "fg:pink";
        pipestatus_separator = "[❯](basalt)";

        not_executable_symbol = " ";
        not_found_symbol = "󱞃 ";
        sigint_symbol = "󰚌 ";
        signal_symbol = "󱐋 ";
        symbol = " ";
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
          basalt = "#696B6B";
          petal = "#FFC1DA";
          pink = "#FF90BB";
          sky = "#8ACCD5";
          mint = "#B2F2BB";
        };
      };
    };
  };
}
