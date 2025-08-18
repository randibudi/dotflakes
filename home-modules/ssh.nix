{config, ...}: {
  age.secrets = {
    ssh-private-key = {
      file = ../secrets/ssh-private-key.age;
      path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      mode = "600";
    };
    ssh-public-key = {
      file = ../secrets/ssh-public-key.age;
      path = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      mode = "644";
    };
    ssh-hosts = {
      file = ../secrets/ssh-hosts.age;
      path = "${config.home.homeDirectory}/.ssh/hosts.conf";
      mode = "644";
    };
  };

  programs.ssh = {
    enable = true;
    includes = ["hosts.conf"];
  };
}
