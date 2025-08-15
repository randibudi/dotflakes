{pkgs, ...}: {
  imports = [./nixos-modules];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "asus-m3400qa";

  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-l2tp
      networkmanager-strongswan
    ];
  };
  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
  };
  console.useXkbConfig = true;

  services.libinput.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  services.printing.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  users.users.randizzwell = {
    isNormalUser = true;
    description = "Randi Budi";
    initialHashedPassword = "$6$Cx9Cr0nQgYXT.iGv$0dnMdi/.ZoXIc.TAt9A1bxSncW/FDsOVy1HzjWo/iIIwwimOtBNKrw6JtNH/Thqfhv08W9ZC.t.FCibj8xlLq/";
    extraGroups = ["networkmanager" "wheel"];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
    gnome-disk-utility
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/randizzwell/.dotflakes";
  };

  nix.channel.enable = false;
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["randizzwell"];
    accept-flake-config = true;
    warn-dirty = false;
  };

  system.stateVersion = "25.05";
}
