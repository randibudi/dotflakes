{
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;

    spawn-at-startup = [
      {command = ["xwayland-satellite"];}
      {command = ["nm-applet" "--indicator"];}
      {command = ["waybar"];}
    ];

    environment = {
      DISPLAY = ":0";
      NIXOS_OZONE_WL = "1";
    };

    input = {
      keyboard.xkb = {
        layout = "us";
        variant = "colemak_dh";
        options = "altwin:swap_alt_win";
        model = "asus_laptop";
      };
      touchpad = {
        tap = true;
        dwt = true;
        natural-scroll = true;
        click-method = "clickfinger";
      };
    };

    cursor = {
      hide-when-typing = true;
    };

    outputs = {
      "eDP-1" = {
        mode = {
          width = 2880;
          height = 1800;
        };
        scale = 2;
        position = {
          x = 0;
          y = 0;
        };
      };
      "HDMI-A-1" = {
        mode = {
          width = 1920;
          height = 1200;
        };
        scale = 1.25;
        position = {
          x = 1440;
          y = 0;
        };
      };
    };

    layout = {
      gaps = 16;
      center-focused-column = "never";
      default-column-width.proportion = 0.5;
    };

    window-rules = [
      {
        matches = [
          {app-id = "firefox";}
        ];
        open-maximized = true;
      }
      {
        matches = [
          {title = "Picture-in-Picture";}
        ];
        open-floating = true;
        default-floating-position = {
          relative-to = "bottom-right";
          x = 16;
          y = 16;
        };
      }
      {
        geometry-corner-radius = {
          bottom-left = 12.0;
          bottom-right = 12.0;
          top-left = 12.0;
          top-right = 12.0;
        };
        clip-to-geometry = true;
      }
    ];

    binds = {
      "Mod+Return".action.spawn = "alacritty";
      "Mod+D".action.spawn = "fuzzel";

      "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"];
      "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
      "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
      "XF86AudioMicMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];

      "XF86MonBrightnessUp".action.spawn = ["brightnessctl" "set" "5%+"];
      "XF86MonBrightnessDown".action.spawn = ["brightnessctl" "set" "5%-"];

      "Mod+O".action.toggle-overview = {};
      "Mod+Q".action.close-window = {};

      "Mod+Left".action.focus-column-left = {};
      "Mod+Down".action.focus-window-down = {};
      "Mod+Up".action.focus-window-up = {};
      "Mod+Right".action.focus-column-right = {};
      "Mod+H".action.focus-column-left = {};
      "Mod+J".action.focus-window-or-workspace-down = {};
      "Mod+K".action.focus-window-or-workspace-up = {};
      "Mod+L".action.focus-column-right = {};

      "Mod+Ctrl+Left".action.move-column-left = {};
      "Mod+Ctrl+Down".action.move-window-down = {};
      "Mod+Ctrl+Up".action.move-window-up = {};
      "Mod+Ctrl+Right".action.move-column-right = {};
      "Mod+Ctrl+H".action.move-column-left = {};
      "Mod+Ctrl+J".action.move-window-down-or-to-workspace-down = {};
      "Mod+Ctrl+K".action.move-window-up-or-to-workspace-up = {};
      "Mod+Ctrl+L".action.move-column-right = {};

      "Mod+Shift+Left".action.focus-monitor-left = {};
      "Mod+Shift+Down".action.focus-monitor-down = {};
      "Mod+Shift+Up".action.focus-monitor-up = {};
      "Mod+Shift+Right".action.focus-monitor-right = {};
      "Mod+Shift+H".action.focus-monitor-left = {};
      "Mod+Shift+J".action.focus-monitor-down = {};
      "Mod+Shift+K".action.focus-monitor-up = {};
      "Mod+Shift+L".action.focus-monitor-right = {};

      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = {};
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = {};
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = {};
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = {};
      "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = {};
      "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = {};
      "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = {};
      "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = {};

      "Mod+WheelScrollDown".action.focus-column-right = {};
      "Mod+WheelScrollUp".action.focus-column-left = {};
      "Mod+Ctrl+WheelScrollDown".action.move-column-right = {};
      "Mod+Ctrl+WheelScrollUp".action.move-column-left = {};

      "Mod+Shift+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = {};
      };
      "Mod+Shift+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = {};
      };
      "Mod+Ctrl+Shift+WheelScrollDown" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-down = {};
      };
      "Mod+Ctrl+Shift+WheelScrollUp" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-up = {};
      };

      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+Ctrl+1".action.move-column-to-workspace = 1;
      "Mod+Ctrl+2".action.move-column-to-workspace = 2;
      "Mod+Ctrl+3".action.move-column-to-workspace = 3;
      "Mod+Ctrl+4".action.move-column-to-workspace = 4;
      "Mod+Ctrl+5".action.move-column-to-workspace = 5;
      "Mod+Ctrl+6".action.move-column-to-workspace = 6;
      "Mod+Ctrl+7".action.move-column-to-workspace = 7;
      "Mod+Ctrl+8".action.move-column-to-workspace = 8;
      "Mod+Ctrl+9".action.move-column-to-workspace = 9;

      "Mod+F".action.maximize-column = {};
      "Mod+Shift+F".action.fullscreen-window = {};

      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";

      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      "Mod+V".action.toggle-window-floating = {};
      "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};

      "Print".action.screenshot = {};
    };
  };
}
