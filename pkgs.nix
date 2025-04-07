{ pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    audacity
    appimage-run
    btop
    eza
    fastfetch
    gimp
    ghostty
    gnome-extension-manager
    gnome-tweaks
    hakuneko
    kdePackages.kdenlive
    keepassxc
    libreoffice-fresh
    librewolf
    loupe
    mcrcon
    mediawriter
    nautilus
    ncdu
    osu-lazer-bin
    pcsx2
    protonup
    pomodoro-gtk
    prismlauncher
    qbittorrent
    rar
      unrar
    sm64coopdx
    spotdl
    tldr
    tor-browser
    ventoy-full-gtk
    vesktop
    vlc
    vscodium-fhs
    wget
    winePackages.unstableFull
    wl-clipboard
    yt-dlp
    zip
      unzip
  ];
}
