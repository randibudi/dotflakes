{
  home = {
    username = "randizzwell";
    homeDirectory = "/home/randizzwell";
    stateVersion = "25.05";
  };

  programs.git = {
    enable = true;
    userName = "Randi Budi";
    userEmail = "randibudiprananda@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
