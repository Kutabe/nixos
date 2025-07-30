{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      continuation_prompt = "[∙](basalt) ";
      format = "[╭─\\(](basalt)$os$sudo$username@$hostname[\\)─\\($directory$git_branch$git_status\\) $nix_shell$golang](basalt)\n[╰─](basalt)$character\n";
      palette = "cotton_candy";
      right_format = "$cmd_duration$jobs$status$git_metrics\n";

      character = {
        error_symbol = "[❯](pink)";
        success_symbol = "[❯](sky)";
        vimcmd_symbol = "[❮](petal)";
      };

      cmd_duration = {
        format = " [⏱$duration]($style)";
        min_time = 1000;
        show_milliseconds = false;
        style = "fg:basalt";
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        home_symbol = "🏠";
        read_only = "|🔒";
        read_only_style = "fg:pink";
        style = "fg:sky";
        truncation_length = 4;
        truncation_symbol = "…/";
        substitutions = {
          "/mnt/steam-library" = "steam";
        };
      };

      git_branch = {
        format = " [$symbol$branch(:$remote_branch)]($style)";
        style = "fg:petal";
        symbol = "🌿";
        truncation_length = 20;
        truncation_symbol = "…";
      };

      git_commit = {
        commit_hash_length = 7;
        format = " [\\($hash$tag\\)]($style)";
        only_detached = true;
        style = "fg:basalt";
      };

      git_metrics = {
        added_style = "fg:sky";
        deleted_style = "fg:pink";
        disabled = false;
        format = " [([+$added]($added_style))([-$deleted]($deleted_style))]($style)";
        only_nonzero_diffs = true;
      };

      git_state = {
        am = "AM";
        am_or_rebase = "AM/REBASE";
        bisect = "BISECTING";
        cherry_pick = "CHERRY-PICKING";
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        merge = "MERGING";
        rebase = "REBASING";
        revert = "REVERTING";
        style = "bright-black";
      };

      git_status = {
        ahead = "⬆\${count}";
        behind = "⬇\${count}";
        conflicted = "⚡";
        deleted = "🗑";
        diverged = "🔀";
        format = " [$all_status$ahead_behind]($style)";
        modified = "📝";
        renamed = "📛";
        staged = "✨";
        stashed = "📦";
        style = "fg:pink";
        typechanged = "🔄";
        untracked = "❓";
        up_to_date = "✅";
        use_git_executable = false;
      };

      golang = {
        format = "[$symbol($version)]($style)";
        style = "fg:sky";
        symbol = "🐹";
      };

      hostname = {
        format = "[$hostname]($style)";
        ssh_only = false;
        ssh_symbol = "🌐";
        style = "fg:petal";
      };

      jobs = {
        format = "[$symbol$number]($style)";
        number_threshold = 1;
        style = "fg:basalt";
        symbol = "⚙";
      };

      nix_shell = {
        format = "[$symbol$state]($style)";
        impure_msg = "[impure](dimmed)";
        pure_msg = "[pure](dimmed)";
        style = "fg:sky";
        symbol = "❄";
        unknown_msg = "[unknown](dimmed)";
      };

      os = {
        disabled = false;
        format = "[$symbol](sky)";
        symbols = {
          Linux = "🐧";
          NixOS = "❄";
        };
      };

      status = {
        disabled = false;
        format = "[$symbol$status]($style)";
        map_symbol = true;
        not_executable_symbol = "🚫";
        not_found_symbol = "🔍";
        pipestatus = true;
        pipestatus_format = "[[$pipestatus] ](basalt) [$symbol$common_meaning$signal_name$maybe_int]($style)";
        pipestatus_separator = "[❯](basalt)";
        sigint_symbol = "🧱";
        signal_symbol = "⚡";
        style = "fg:pink";
        symbol = "✖";
      };

      sudo = {
        disabled = false;
        format = "[$symbol]($style)";
        style = "fg:pink";
        symbol = "*";
      };

      username = {
        disabled = false;
        format = "[$user]($style)";
        show_always = true;
        style_root = "fg:pink";
        style_user = "fg:sky";
      };

      palettes = {
        cotton_candy = {
          basalt = "#696B6B";
          coral = "#FF7F7F";
          lavender = "#E6E6FA";
          mint = "#98FB98";
          offwhite = "#F8F8E1";
          petal = "#FFC1DA";
          pink = "#FF90BB";
          sky = "#8ACCD5";
        };
      };
    };
  };
}
