{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];

  nixpkgs.overlays = [inputs.niri.overlays.niri];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.niri = {
      default = "gtk";
      "org.freedesktop.impl.portal.Secret" = "kwallet";
      "org.freedesktop.impl.portal.ScreenCast" = "gnome";
    };
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${lib.getExe pkgs.greetd.tuigreet} --remember --time --cmd niri-session";
      user = "greeter";
    };
  };

  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    fuzzel
    mako
    networkmanagerapplet
    pavucontrol
    waybar
    xwayland-satellite-unstable
  ];

  fonts.packages = with pkgs; [
    font-awesome
  ];
}
