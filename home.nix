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
    devenv
    filezilla
    nvf
    p7zip
    sshs
    unzip
    vscode
    zip
  ];

  programs.direnv = {
    enable = true;
  };
}
