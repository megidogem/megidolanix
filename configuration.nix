{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ./pkgs.nix
    ./nvidia.nix
    ./sway.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_lqx;
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

  hardware = {
    bluetooth = {
      enable = false;
      powerOnBoot = false;
    };
    graphics.enable = true;
  };

  networking = {
    hostName = "valor";
    networkmanager.enable = true;
    nftables.enable = true;
    wireless.enable = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 22000 25577 25578 25579 ]; # Syncthing, SSH, Mine...
      allowedUDPPorts = [ 21027 22000 25577 25578 ];
    };
  };

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

  services = {
    locate = {
      enable = true;
      interval = "hourly";
      package = pkgs.plocate;
    };

    xserver = {
      enable = true;
      layout = "es";
      videoDrivers = [ "nvidia" ];
      displayManager = {
        gdm.enable = false;
        autoLogin = {
          enable = false;
          user = "marko";
        };
      };

      desktopManager = {

      gnome.enable = false;

      retroarch = {
        enable = false;
        package = pkgs.retroarch;
      };

    };

  };

    gnome.core-utilities.enable = false;

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

    flatpak.enable = true;
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

  virtualisation = {
    virtualbox.host = {
      enable = true;
      enableExtensionPack = false;
    };
    libvirtd.enable = false;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

  environment.gnome.excludePackages = (with pkgs; [gnome-tour]);

  environment = {
    variables.EDITOR = "vim";
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "/home/marko/.steam/root/compatibilitytools.d";
    };
  };
  programs = {
    bat.enable = true;
    evince.enable = false;
    file-roller.enable = false;
    fish.enable = false;
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

# Esto es una movida pal autologin de GNOME
  #systemd.services."getty@tty1".enable = false;
  #systemd.services."autovt@tty1".enable = false;

}
