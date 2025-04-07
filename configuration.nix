{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./pkgs.nix
  ];

  # Boot settings
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    blacklistedKernelModules = [ "kvm_intel" "kvm_amd" "kvm" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    plymouth.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    inter-nerdfont
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  # Hardware configuration
  hardware = {
    bluetooth = {
      enable = false;
      powerOnBoot = false;
    };
    graphics.enable = true;
  };

  # Networking
  networking = {
    hostName = "wisdom";
    networkmanager.enable = true;
    nftables.enable = true;
    wireless.enable = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22000 25577 25578 25579 ]; # Syncthing, SSH, Mine...
      allowedUDPPorts = [ 21027 22000 25577 25578 ];
    };
  };

  # Time and locale
  time.timeZone = "Europe/Madrid";
  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "es_ES.UTF-8";
      LC_IDENTIFICATION = "es_ES.UTF-8";
      LC_MEASUREMENT = "es_ES.UTF-8";
      LC_MONETARY = "es_ES.UTF-8";
      LC_NAME = "es_ES.UTF-8";
      LC_NUMERIC = "es_ES.UTF-8";
      LC_PAPER = "es_ES.UTF-8";
      LC_TELEPHONE = "es_ES.UTF-8";
      LC_TIME = "es_ES.UTF-8";
    };
  };

  console.keyMap = "es";

  # Services
  services = {

    locate = {
      enable = true;
      interval = "hourly";
      package = pkgs.plocate;
    };

    xserver = {
      enable = true;
      layout = "es";
      #videoDrivers = [ "nvidia" ];
      displayManager = {
        gdm.enable = true;
        autoLogin = {
          enable = true;
          user = "marko";
        };
      };
      desktopManager.gnome.enable = true;
    };

    gnome = {
      core-utilities.enable = false;
    };


    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    syncthing = {
      enable = true;
      user = "marko";
      dataDir = "/home/marko/Sync";
      configDir = "/home/marko/.config/syncthing";
    };

    flatpak.enable = false;
    teamviewer.enable = false;
    openssh.enable = true;
    openssh.ports = [ 25577 ];
  };

  security.rtkit.enable = true;

  users.users.marko = {
    isNormalUser = true;
    description = "marko";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "vboxusers" ];
    packages = with pkgs; [];
  };

  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = false;
  };
  virtualisation.libvirtd.enable = false;

  environment.gnome.excludePackages = (with pkgs; [ ]);

  environment = {
    variables.EDITOR = "vim";
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "/home/marko/.steam/root/compatibilitytools.d";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs = {
    bat.enable = true;
    evince.enable = true;
    file-roller.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    git = {
      enable = true;
      prompt.enable = false;
    };
    htop.enable = true;
    java.enable = true;
    nix-ld.enable = true;
    obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.droidcam-obs ];
    };
    steam.enable = true;
    vim = {
      enable = true;
      defaultEditor = true;
    };
    yazi.enable = true;
    xwayland.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  system = {
    stateVersion = "24.11";
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      max-jobs = 2;
    };
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
