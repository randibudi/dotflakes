{
  lib,
  pkgs,
  ...
}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "${lib.getExe pkgs.niri-unstable} msg action power-off-monitors";
      }
      {
        timeout = 600;
        command = "${lib.getExe pkgs.swaylock-effects} -fF";
      }
      {
        timeout = 1800;
        command = "${lib.getExe' pkgs.systemd "systemctl"} suspend";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${lib.getExe pkgs.swaylock-effects} -fF";
      }
      {
        event = "after-resume";
        command = "${lib.getExe pkgs.niri-unstable} msg action power-on-monitors";
      }
    ];
  };
}
