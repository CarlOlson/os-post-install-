{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "17.09";

  networking.hostName = "nixos";

  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "US/Central";

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  environment.systemPackages = with pkgs; [
    coreutils git nox oh-my-zsh tree ts wget xclip zsh
    p7zip unrar unzip
    ffmpeg-full youtube-dl
    mongodb-tools

    pavucontrol qbittorrent yakuake

    exfat ntfs3g

    (import ./emacs.nix { inherit pkgs; })
  ];

  services.xserver = {
    enable = true;
    layout = "us";
    autorun = true;
    videoDrivers = [ "nvidia" ];
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  users.extraUsers.carl = {
    isNormalUser = true;
    home = "/home/carl";
    description = "Carl Olson";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ (import ./osx_rsa.pub) ];
  };

  sound.mediaKeys = {
    enable = true;
    volumeStep = "5%";
  };

  hardware.pulseaudio.enable = true;

  nix.maxJobs = 4;
  nix.buildCores = 4;
  nix.useSandbox = true;

  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "pgdnlhfefecpicbbihgmbmffkjpaplco" # ublock origin extra
      "dhdgffkkebhmkfjojejmpbldmpobfkfo" # tampermonkey stable
      "hdokiejnpimakedhajhdlcegeplioahd" # lastpass
    ];
    extraOpts = {
      DefaultPluginsSetting = 3; # click to run flash
      PasswordManagerEnabled = false;
      RestoreOnStartup = 1; # restore session
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    ohMyZsh = {
      enable = true;
      plugins = ["git" "wd"];
      theme = "sunrise";
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets"];
    };
  };

  fonts = {
    enableFontDir = true;
    enableCoreFonts = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      bakoma_ttf
      corefonts
      dejavu_fonts
      gentium
      liberation_ttf
      inconsolata
      terminus_font
      ubuntu_font_family
    ];
  };

  services.hydra = {
    enable = true;
    port = 8080;
    listenHost = "localhost";
    hydraURL = "hydra.example.org";
    notificationSender = "hydra@example.org";
  };

  services.postgresql.enable = true;
  services.mongodb.enable = true;

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  services.samba.enable = true;
  services.samba.extraConfig = "
    unix extensions = no
    follow symlinks = yes
    wide links = yes
    map to guest = Bad User
  ";
  services.samba.shares = {
    samba = {
      path = "/samba";
      public = "yes";
      writeable = "no";
    };
  };

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    139 445 # samba
  ];
  networking.firewall.allowedUDPPorts = [
    137 138 # samba
  ];

  fileSystems."/mnt/Backup" = {
    device = "/dev/disk/by-label/Backup";
    fsType = "ntfs";
  };

  fileSystems."/mnt/Music" = {
    device = "/dev/disk/by-label/Music";
  };

  fileSystems."/mnt/Video" = {
    device = "/dev/disk/by-uuid/F220C70420C6CF33";
    fsType = "ntfs";
  };

  fileSystems."/mnt/Backup81" = {
    device = "/dev/disk/by-uuid/7ecd53b5-42a2-41c8-baf5-5ff8aa22e1ef";
    fsType = "ext4";
  };
}
