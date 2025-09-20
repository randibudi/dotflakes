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
      command = "${lib.getExe pkgs.tuigreet} --remember --time --cmd niri-session";
      user = "greeter";
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    inputs.quickshell.packages.${system}.default
    networkmanagerapplet
    pavucontrol
    wezterm
    xwayland-satellite-unstable
  ];

  fonts.packages = with pkgs; [
    font-awesome
  ];
}
