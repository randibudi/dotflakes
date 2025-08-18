{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.agenix.homeManagerModules.default];

  home.packages = [pkgs.age];

  age.identityPaths = ["${config.home.homeDirectory}/.dotflakes/dotflakes.key"];
}
