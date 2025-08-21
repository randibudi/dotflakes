{
  inputs,
  pkgs,
  ...
}: {
  imports = [./home-modules];

  home = {
    username = "randizzwell";
    homeDirectory = "/home/randizzwell";
    stateVersion = "25.05";
  };

  home.packages = with pkgs; let
    nvf = inputs.nvf-config.packages.${pkgs.system}.default;
  in [
    beeper
    filezilla
    nvf
    sshs
    vscode
  ];
}
