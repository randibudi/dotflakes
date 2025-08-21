{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  programs.starship = {
    enable = true;
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        default_prog = { "fish" }
      }
    '';
  };
}
