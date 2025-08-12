{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
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
