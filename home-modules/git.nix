{
  programs.git = {
    enable = true;
    userName = "Randi Budi";
    userEmail = "randibudiprananda@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
